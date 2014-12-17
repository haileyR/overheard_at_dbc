get '/' do
  @posts = Post.all
  erb :'index', locals: {posts: @posts}
end