
# Change from user profile to profile  

get '/profile' do
	@user = User.find_by(id: session[:id])
erb :profile
end
##############################################f



#This is to edit/update profile page 
put '/profile' do
	@user = User.find_by_id(session[:id])
	if params[:name] != nil
		@user.name = params[:name]
	end
	
	if params[:email] != nil
		@user.email = params[:email]
	end
	
	if @user.save
		redirect '/'
	else

	redirect '/profile' #with a flash message or all.tweets
end
end

#Do we want to redirect or post a flash message
##############################################

# We need to redirect to a confirmation page after delete/destroy

delete '/profile/:id' do 
	if session[:id]
		@user.find_by(id: session[:id])
		if @user.destroy
			redirect '/'
		end
	end
	# redirect '/'
end








