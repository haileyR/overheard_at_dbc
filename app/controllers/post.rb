get '/' do
  if request.xhr?
    @posts = Post.order_by(params[:order])
    erb :'posts/_post_list', locals: {posts: @posts}, layout: false
  else
    @posts = Post.order_by('upvote')
    erb :'index', locals: {posts: @posts}
  end
end


get '/posts/new' do
  # return an HTML form for creating a new post
  erb :'posts/new'
end

post '/posts' do
  # create a new post
  @post = Post.create(params[:post])
  @post.update(user_id: session[:user_id])
  @post.save
  # p '/posts/#{@post.id}'
  redirect '/'
end

get '/posts/:id' do |id|
  post = Post.find id
  erb :'posts/single', locals: {post: post}
end

get '/posts/:id/upvote' do |id|
  postvote = Postvote.find_by(post_id: params[:id])
  if postvote
    postvote.update(up_count: (postvote.up_count + 1))
  else
    postvote = Postvote.create(post_id: params[:id], up_count: 1, down_count: 0)
  end
  "#{postvote.up_count}"
end

get '/posts/:id/downvote' do |id|
  postvote = Postvote.find_by(post_id: params[:id])
  if postvote
    postvote.update(down_count: (postvote.down_count + 1))
  else
    postvote = Postvote.create(post_id: params[:id], down_count: 1, up_count: 0)
  end
  "#{postvote.down_count}"
end

get '/posts/:id/edit' do |id|
  # return an HTML form for editing a post
  # @post = Post.find id
  # erb :'posts/edit'
end

put '/posts/:id' do |id|
  post = Post.find(id)
  post.update(params[:post], user_id: session[:user_id])

  # if request.xhr?
  #   erb :'posts/single', locals: {post: post}, layout: false
  # else
  #   redirect ("/")
  # end
end

delete '/posts/:id' do |id|
  # delete a specific post
  @post = Post.find id
  @post.destroy
  redirect '/posts'
end
