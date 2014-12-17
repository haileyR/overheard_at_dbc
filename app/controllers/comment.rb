get '/comments' do
  # display a list of all comments
  # @comments = Comment.all
  # erb :'comments/index'
end

get '/comments/new' do
  # return an HTML form for creating a new comment
  # erb :'comments/new'
end

post '/comments' do
  # create a new comment
  # @comment = Comment.create(params[:comment])
  # redirect '/comments'
end

get '/comments/:id' do |id|
  # display a specific comment
  # @comment = Comment.find id
  # erb :'comments/single'
end

get '/comments/:id/edit' do |id|
  # return an HTML form for editing a comment
  # @comment = Comment.find id
  # erb :'comments/edit'
end

put '/comments/:id' do |id|
  # update a specific comment
  # @comment = Comment.find id
  # @comment.update(params[:comment])
  redirect 'entries/#{@comment.id}'
end

delete '/comments/:id' do |id|
  # delete a specific comment
  # @comment = Comment.find id
  # @comment.destroy
  # redirect '/comments'
end
