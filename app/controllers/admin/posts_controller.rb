class Admin::PostsController < Admin::ApplicationController

  #Blog列表
  def index
    @posts = Post.order('id DESC').page(params[:page]).per(params[:per] || 8)
  end

  #新建Blog
  def new
    @post = Post.new
  end

  def create
    @post = Post.new post_params
    #@post.user = current_user
    if @post.save
      redirect_to admin_posts_path
    else
      render :new
    end
  end


  #编辑Blog
  def edit
    @post = Post.find params[:id]
  end

  def update
    @post = Post.find params[:id]
    if @post.update post_params
      redirect_to admin_posts_path
    else
      render :edit
    end
  end

  #删除BLog
  def destroy
    @post = Post.find params[:id]
    @post.destroy
    redirect_to admin_posts_url
  end

  private
  def post_params
    params.require(:post).permit(:title, :content, :tag_list, :desc)
  end
end
