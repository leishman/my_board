before do
  @logged_in = session[:id] ? true : false
end

use Rack::Flash
enable :sessions



get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/login' do
  user = User.find_by_username(params[:username])
  if signed_in?
  	redirect "/" + params[:user][:username]
  else
  	redirect '/'
  end
end

get '/signup' do
	erb :signup
end

get '/login' do
	erb :login
end
