class Admin::UsersController < ApplicationController

  before_filter :restrict_access

  def index
    @users = User.order(:firstname).page(params[:page]).per(10)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
      if @user.save
        redirect_to admin_users_path
      else
        render :new
      end
  end

  def show 
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to admin_users_path
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
      UserMailer.goodbye_email(@user).deliver
      flash[:success] = "User deleted"
      @user.destroy
      redirect_to admin_users_path
  end

  protected

  def restrict_access
    if !admin? 
      flash[:alert] = "You must be an admin to view!"
      redirect_to root_path
    end
  end

  def user_params
    params.require(:user).permit(:email, :firstname, :lastname, :password, :password_confirmation, :admin)
  end

end
