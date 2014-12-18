get '/login' do
  erb :'auth/login'
end

post '/login' do
  user = User.find_by(name: params[:user][:name])
  if user && user.authenticate(params[:user][:password])
    session[:user_id] = user.id
    redirect '/'
  else
    # set_error("Login failed.")
    redirect '/login'
  end
  redirect '/'
end

get '/register' do
  erb :'auth/register'
end

post '/register' do
  # create a new user
  user = User.new(params[:user])
  if user.save
    session[:user_id] = user.id
    redirect '/'
  else
    # display errors to user
    redirect '/signup'
  end
end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end

get '/users/:id/edit' do |id|
  # return an HTML form for editing a user
  # @user = User.find id
  # erb :'users/edit'
end

put '/users/:id' do |id|
  # update a specific user
  # @user = User.find id
  # @user.update(params[:user])
  redirect 'entries/#{@user.id}'
end

delete '/users/:id' do |id|
  # delete a specific user
  # @user = User.find id
  # @user.destroy
  # redirect '/users'
end
