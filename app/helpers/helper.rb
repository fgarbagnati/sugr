helpers do
  def current_user
    if session[:id] == User.id
    end
  end
end
