get '/' do
  @posts = Post.all
  erb :'index', locals: {posts: @posts}
end


get '/posts/new' do
  # return an HTML form for creating a new post
  erb :'posts/new'
end

post '/posts' do
  # create a new post
  @post = Post.create(params[:post])
  # p '/posts/#{@post.id}'
  redirect '/'
end

get '/posts/:id' do |id|
  # if request.xhr?

  post = Post.find id
  erb :'posts/single', locals: {post: post}
end

get '/posts/:id/edit' do |id|
  # return an HTML form for editing a post
  # @post = Post.find id
  # erb :'posts/edit'
end

put '/posts/:id' do |id|
  post = Post.find(id)
  post.update(params[:post])

  # if request.xhr?
  #   erb :'posts/single', locals: {post: post}, layout: false
  # else
  #   redirect ("/")
  # end
end

delete '/posts/:id' do |id|
  # delete a specific post
  # @post = Post.find id
  # @post.destroy
  # redirect '/posts'
end
