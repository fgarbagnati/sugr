get '/' do
  if session[:id]
    @user = User.find(session[:id])
    redirect "/account_page/#{@user.id}"
  else
    redirect '/login_or_signup'
  end
end

get '/account_page/:id' do
  if session[:id].to_s == params[:id].to_s
    @user = User.find(params[:id])
    list_of_followers = Follower.following(@user.id)
    followers = []
    list_of_followers.each do |follow|
      followers << follow.followed_id
    end

    @morsels = []
    followers.each do |id|
      @morsels << Morsel.where(:user_id => id)
    end
    erb :account_page
  else
    redirect '/'
  end
end

post '/account_page/:id' do
  @user = User.find(params[:id])
  @user.morsels.create(:sweet => params[:morsel])




  redirect "/account_page/#{params[:id]}"
end

post '/follow/:user' do
  @logged_in_user = User.find(session[:id])
  @profile = User.find_by_username(params[:user])
  p @profile
  Follower.create(:follows_id => @logged_in_user.id, :followed_id => @profile.id)
  redirect "/user/#{@profile.username}"
end

get '/login_or_signup' do
  @sweets = Morsel.order("created_at DESC")
  erb :login_or_signup
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
    redirect "/account_page/#{@user.id}"
  else
    redirect '/signup'
  end
end

get '/signup' do
  erb :signup
end

post '/signup' do
  @user = User.create(params)
  if @user.valid?
    session[:id] = @user.id
    redirect "/account_page/#{@user.id}"
  else
    redirect "/signup"
  end
end

get '/logout' do
  session.clear
  redirect '/'
end

get '/follows/:user' do
  @logged_in_user = User.find(session[:id])
  @profile_user = User.find_by_username(params[:user])

  @followers2 = Follower.where(:follows_id => @profile_user.id)
  @users2 = []
  @followers2.each do |follower|
    @users2 << User.find(follower.followed_id)
  end

  @followers = Follower.where(:followed_id => @profile_user.id)
  @users = []
  @followers.each do |follower|
    @users << User.find(follower.follows_id)
  end

  erb :follows
end




