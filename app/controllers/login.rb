require 'sanitize'

get '/' do
  if session[:id]
    @title = "Welcome to Tweet"
    begin
      user = User.find(session[:id])
      @tweets = user.tweets + user.followees.map { |followee| followee.tweets }.flatten
      @tweets.sort! { |a, b| a.created_at <=> b.created_at }.reverse!
      erb :"tweets/tweet"
    rescue
      session[:id] = nil
      erb :signin
    end

  else
    erb :signin
  end
end

get '/signup' do
  erb :signup
end

post '/signup' do
  params.each_value { |value| value.replace(Sanitize.clean(value)) }
  user = User.new(handle: params[:handle], email: params[:email], name: params[:name], password: params[:password], password_confirmation: params[:password_confirmation] )
  user.save
  if user
    session[:id] = user.id
  end
  redirect '/'
end

post '/signin' do
  params.each_value { |value| value.replace(Sanitize.clean(value)) }
  user = User.find_by(email: params[:email]).try(:authenticate, params[:password])
  if user
    session[:id] = user.id
  end
  redirect '/'
end

post '/signout' do
  session[:id] = nil
  redirect '/'
end


