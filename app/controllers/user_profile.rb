
# Change from user profile to profile  

get '/profile' do
	
erb :profile
end
##############################################f




put '/update_profile' do
@user.find_by(email: params[:email])

erb :update_profile
redirect '/user_profile'
end


#put the delete logic into the view

# delete '/delete_profile/:id' do 
# 	@user.find_by(email: params[:email])
# 	@user.destroy

# end




# post "/users/sign_up" do
#   user = User.new(username: params[:username], password: params[:password])
 
#   if passwords_do_not_match
#     @flash = "Passwords must match."
#     erb :sign_up
#   elsif user.save
#     session[:user_id] = user.id
#     redirect "/"
#   else
#     @flash = user.errors.messages
#     erb :sign_up
#   end
# end






