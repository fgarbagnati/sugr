get '/' do
  if session[:id]
    @user = User.find(session[:id])
    redirect "/accountpage/#{@user.id}"
  else
    redirect '/loginorsignup'
  end
end

get '/accountpage/:id' do
  if session[:id].to_s == params[:id].to_s
    @user = User.find(params[:id])
    erb :accountpage
  else
    redirect '/'
  end
end

get '/loginorsignup' do
  erb :loginorsignup
end

get '/login' do
  erb :login
end

post '/login' do
  @user = User.find_by_username(params[:username])
  if @user == nil
    redirect '/signup'
  elsif @user.password == params[:password]
    session[:id] = @user.id
    redirect "/accountpage/#{@user.id}"
  else
    redirect '/signup'
  end
end

get '/signup' do
  erb :signup
end

post '/signup' do
  @user = User.create(params)
  redirect "/account/#{@user.id}"
end

get '/logout' do
  session.clear
  redirect '/'
end

