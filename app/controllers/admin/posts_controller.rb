class Admin::PostsController < Admin::ApplicationController

  #Blog列表
  def index
    @posts = Post.all
  end

  #新建Blog
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save()
      redirect_to admin_posts_path
    else
      render action: 'new'
    end
  end

  #编辑Blog
  def edit
  end

  def update
    if @post.update_attributes(post_params)
      redirect_to admin_posts_path
    else
      render action: 'edit'
    end
  end

  #删除BLog
  def destroy
    @post.delete()
    redirect_to admin_posts_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :content, :desc)
  end
end
