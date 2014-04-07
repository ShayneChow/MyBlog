class PostsController < ApplicationController
  def index
    @posts = Post.order('id DESC').page(params[:page])
  end

  def show
    @post = Post.find params[:id]
  end
end
