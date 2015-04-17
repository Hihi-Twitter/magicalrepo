get '/users' do
  @title = "All Users!"
  @users = User.all
  # @users.each do
  #   if user.followers.include?(session[:id])
  #    @follow = true
  #   else
  #     @follow = false
  #   end
  # end


  erb :"tweets/users"
end

post '/follow' do
  current_user = User.find(session[:id])
  to_follow = User.find(params[:id])
  to_follow.followers << current_user
  redirect '/users'
end

post '/unfollow' do
  current_user = User.find(session[:id])
  unfollow = User.find(params[:id])
  unfollow.followers.delete(current_user)
  redirect '/users'
end
