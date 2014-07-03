class PostsController < ApplicationController
  def index
    @posts = Post.order('id DESC').page(params[:page])
    if params[:tag]
      @posts = Post.tagged_with(params[:tag]).order('id DESC').page(params[:page])
    else
      @posts = Post.order('id DESC').page(params[:page])
    end
  end

  def show
    @post = Post.find params[:id]
  end
end
