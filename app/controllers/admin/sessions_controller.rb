class Admin::SessionsController < Admin::ApplicationController
  layout 'login'

  def new
    @user = User.new
  end

  def create
    @user = User.authentication(params[:email], params[:password])
    if @user
      session[:user_id] = @user.id
      flash[:notice] = "Welcome #{@user.name}"
      redirect_to admin_root_path
    else
      flash[:notice] = "The email or password is not correct."
      redirect_to admin_login_path
    end
  end

  def destroy
    reset_session
    redirect_to admin_login_path
  end
end
