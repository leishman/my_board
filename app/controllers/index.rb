get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/:username' do
  user = User.find_by_username(params[:username])
end
