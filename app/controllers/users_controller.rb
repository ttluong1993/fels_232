class UsersController < ApplicationController
  before_action :logged_in_user, only: :show
  
  def new
    if logged_in?
      redirect_to current_user
    else
      @user = User.new
    end
  end

  def create
    @user = User.new user_params
    if @user.save
      log_in @user
      flash[:success] = t ".success_signup"
      redirect_to @user
    else
      render :new
    end
  end

  def show
    @user = User.find_by id: params[:id]
    unless @user
      flash[:danger] = t ".user_not_exist"
      redirect_to root_path
    end
  end

  private
  def user_params
    params.require(:user).permit :name, :email, :password, 
      :password_confirmation
  end
end
