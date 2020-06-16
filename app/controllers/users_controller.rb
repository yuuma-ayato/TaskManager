class UsersController < ApplicationController
  def new
    if logged_in?
      redirect_to tasks_path
    else
      @user = User.new
    end
  end

  def create
    if logged_in?
      redirect_to tasks_path
    else
      @user = User.new(user_params)
      respond_to do |format|
        if @user.save
          session[:user_id] = @user.id
          format.html { redirect_to '/tasks' }
        else
          format.js { render :new }
        end
      end
    end
  end

  def show
    @user = User.find(params[:id])
    if @user.id != current_user.id
      redirect_to tasks_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end
end
