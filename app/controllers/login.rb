require 'sanitize'

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
  clean_params = Hash[params.map{|k,value| [k,Sanitize.clean(value)]}]

  user = User.new(handle: clean_params[:handle], email: clean_params[:email], name: clean_params[:name], password: clean_params[:password], password_confirmation: clean_params[:password_confirmation] )
  user.save
  if user
    session[:id] = user.id
  end
  redirect '/'
end

post '/signin' do
  clean_params = Hash[params.map{|k,value| [k,Sanitize.clean(value)]}]

  user = User.find_by(email: clean_params[:email]).try(:authenticate, clean_params[:password])
  if user
    session[:id] = user.id
  end
  redirect '/'
end

post '/signout' do
  session[:id] = nil
  redirect '/'
end


