before do
  @logged_in = session[:id] ? true : false
end

use Rack::Flash
enable :sessions

get '/' do
  erb :index
end

#------ SESSIONS -------
post '/login' do
  assign_user
  authorized_redirect('/', )
  if signed_in?
    redirect("/" + params[:user][:username])
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

delete '/logout' do
  sign_out
  redirect '/'
end

#------ USERS -------

get '/:username' do
  if signed_in?
    @user = current_user
    @profile = @user.profile
    erb :user_private
  else
    erb :user_public
  end
end

post '/users' do
  user = User.new(params[:user])
  if user.valid?
    user.save
    assign_user
    sign_in
    redirect('/' + params[:user][:username])
  else
    flash[:errors] = user.errors.messages
    redirect '/signup'
  end
end