class UsersController < ApplicationController

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

  def edit
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
  end

protected

  def user_params
    params.require(:user).permit(:email, :firstname, :lastname, :password, :password_confirmation, {avatars: []})
  end


end
