class UsersController < ApplicationController
   before_action :admin_user, only: [:index]

  def index
    @users = User.order(:firstname).page(params[:page]).per(5)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to movies_path
    else
      render :new
    end
  end

protected

  def user_params
    params.require(:user).permit(:email, :firstname, :lastname, :password, :password_confirmation, {avatars: []})
  end

   def admin_user
     redirect_to(root_url) unless current_user.admin?
  end

end
