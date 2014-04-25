get "/user/:username" do
  @user = User.find_by_username(params[:username])
  @sweets = Morsel.where(user_id: @user.id)
  erb :profile_page
end
