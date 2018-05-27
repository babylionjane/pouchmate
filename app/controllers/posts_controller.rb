class PostsController < ApplicationController
  def index
    @posts = Post.all
  end
  
  def new
    @post = Post.new
  end

  def create
    post = Post.new
    post.title = params[:post][:title]
    post.content = params[:post][:content]
    post.save
    redirect_to '/'
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.title = params[:post][:title]
    post.content = params[:post][:content]
    post.save
    redirect_to '/'
  end

  def destroy
    Post.find(params[:id]).destroy
    redirect_to '/'
  end
end
