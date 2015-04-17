
post '/tweet' do
	@tweet = Tweet.new(content: params[:content])
	@tweet.user_id = session[:id]
	if @tweet.save
		session[:message] = {success: true, message: "Success!"}
		redirect '/'
	else
		session[:message] = {success: false, message: "Error! Tweet allows 140 characters only."}
		redirect '/'
	end
end


get '/retweet/:id' do
	@title = "Retweet!"
	@tweet = Tweet.find_by_id(params[:id])
	@user = User.find_by_id(@tweet.user_id)
	erb :"tweets/retweet"
end


post '/retweet/:id' do
	tweet = Tweet.find_by_id(params[:id])
	tweet.count_retweet = tweet.count_retweet + 1
	tweet.save
	current_user_id = session[:id]

	# create new record of tweeter
	retweet = TweetersRetweeter.new(user_id: current_user_id, tweet_id: params[:id])
	retweet.save
	redirect '/'
end

get '/users' do
	@title = "All User!"
	@users = User.all

	erb :"tweets/users"
end


