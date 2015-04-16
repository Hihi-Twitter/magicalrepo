get '/users' do
  erb :users
end

post '/follow' do
  current_user = User.find(session[:id])
  to_follow = User.find(params[:user_to_follow])
  to_follow.followers << current_user
  redirect '/users'
end

delete '/follow' do
  current_user = User.find(session[:id])
  unfollow = User.find(params[:user_to_unfollow])
  unfollow.followers.delete(current_user)
  redirect '/users'
end
