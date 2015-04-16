get '/tweet/new' do
	@title = "Welcome to Tweet"
	# current_user_id = session[:id]
	current_user_id = 1
	@tweets = Tweet.includes(:user).all
	erb :"tweets/tweet"
end

post '/new' do
	@tweet = Tweet.new(content: params[:content])
	# @tweet.user_id = session[:id]
	@tweet.user_id = 2
	if @tweet.save
		session[:message] = {success: true, message: "Success!"}
		redirect '/tweet/new'
	else
		session[:message] = {success: false, message: "Error"}
		redirect '/tweet/new'
	end
end

post '/retweet' do
	tweet = Tweet.find_by_id(params[:id])
	# user = User.find_by_id(tweet.user_id)
	tweet.count_retweet = tweet.count_retweet + 1
	tweet.save

	# current_user_id = session[:id]
	current_user_id = 1
	# create new record of tweeter
	retweet = TweeterRetweeter.new(user_id: current_user_id, tweet_id: params[:id])
	retweet.save
	# redirect '/tweet/new'
end