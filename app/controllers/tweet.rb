<<<<<<< HEAD:app/controllers/tweet.rb
post '/tweet' do
=======
get '/tweet/new' do
	@title = "Welcome to Tweet"
	current_user_id = session[:id]
	@tweets = Tweet.includes(:user).all
	erb :"tweets/tweet"
end

post '/new' do
>>>>>>> f5d7deced5759f54291fe0183841611ca6ccbd07:app/controllers/index.rb
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
<<<<<<< HEAD:app/controllers/tweet.rb
	# redirect '/tweet/new'
end
=======
	redirect '/tweet/new'
end

get '/users' do
	@title = "All User!"
	@users = User.all

	erb :"tweets/users"
end
>>>>>>> f5d7deced5759f54291fe0183841611ca6ccbd07:app/controllers/index.rb
