class UsersController < ApplicationController
  before_action :require_signin, except: [:new, :create]
  before_action :require_current_user, only: [:edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user, notice: "Thanks for signing up"
    else
      render :new
    end
  end

  def edit
    # can remove because it gets done by is_current_user in the before_action
    # @user = User.find(params[:id])
  end

  def update
    # can remove because it gets done by is_current_user in the before_action
    # @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      redirect_to @user, notice: "Updates have been saved."
    else
      render :edit
    end
  end

  def destroy
    # can remove because it gets done by is_current_user in the before_action
    # @user = User.find(params[:id])
    @user.destroy
    session[:user_id] = nil
    redirect_to root_url, alert: "Account successfully deleted!"
  end


private

  def require_current_user
    #since we need to make this active record call for this method, and this method is a before action, we can remove the same line in the edit, update, and destroy actions
    @user = User.find(params[:id])
    unless current_user?(@user)
      redirect_to root_url
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
