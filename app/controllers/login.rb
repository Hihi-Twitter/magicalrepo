get '/' do
  if session[:id]
    erb :feed
  else
    erb :signin
  end
end

get '/signup' do
  erb :signup
end

post '/signup' do
  redirect '/'
end

post '/signin' do
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


