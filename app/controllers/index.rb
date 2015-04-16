get '/tweet/new' do
	@title = "Welcome to Tweet"
	erb :"tweets/tweet"
end