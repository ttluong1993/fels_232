class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show, :edit, :update]
  before_action :find_user, only: [:show, :edit, :update]
  before_action :correct_user, only: [:edit, :update]

  def index
    @users = User.all.paginate page: params[:page], per_page: Settings.users.per_page
  end
  
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
    @lessons = @user.lessons.paginate page: params[:page], 
      per_page: Settings.lessons.per_page
  end

  def edit
  end

  def update
    if @user.update_attributes user_params
      flash[:success] = t ".profile_updated"
      redirect_to @user
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit :name, :email, :password, 
      :password_confirmation
  end

  def find_user
    @user = User.find_by id: params[:id]
    unless @user
      flash[:danger] = t ".user_not_exist"
      redirect_to root_path
    end
  end

  def correct_user
    redirect_to root_url unless @user.current_user? current_user
  end
end
