class Admin::UsersController < Admin::AdminController
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


end
