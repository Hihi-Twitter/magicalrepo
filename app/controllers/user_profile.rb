
# Change from user profile to profile  

get '/profile' do
	@user = User.find_by(id: session[:id])
erb :profile
end
##############################################f



#This is to edit/update profile page 
put '/profile' do
	if params[:name] != nil
	@user.name = params[:name]
	end
	
	if params[:email] != nil
	@user.email = params[:email]
	end

	@user.save!

redirect '/profile' #with a flash message or all.tweets
end

#Do we want to redirect or post a flash message
##############################################

# We need to redirect to a confirmation page after delete/destroy

delete '/profile/:id' do 
	if session[:id]
		user.find_by(id: session[:id])
		user.destroy
	end
	redirect '/'
end








