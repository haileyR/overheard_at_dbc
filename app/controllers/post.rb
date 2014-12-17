
get '/posts/new' do
  # return an HTML form for creating a new post
  # erb :'posts/new'
end

post '/posts' do
  # create a new post
  # @post = Post.create(params[:post])
  # redirect '/posts'
end

get '/posts/:id' do |id|
  # display a specific post
  # @post = Post.find id
  # erb :'posts/single'
end

get '/posts/:id/edit' do |id|
  # return an HTML form for editing a post
  # @post = Post.find id
  # erb :'posts/edit'
end

put '/posts/:id' do |id|
  # update a specific post
  # @post = Post.find id
  # @post.update(params[:post])
  redirect 'entries/#{@post.id}'
end

delete '/posts/:id' do |id|
  # delete a specific post
  # @post = Post.find id
  # @post.destroy
  # redirect '/posts'
end
