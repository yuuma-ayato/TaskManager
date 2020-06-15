class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    respond_to do |format|
      if user && user.authenticate(params[:session][:password])
        session[:user_id] = user.id
        format.js { redirect_to "/tasks" }
      else
        flash.now[:notice] = 'ログインに失敗しました'
        format.js { render :new }
      end
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:notice] = "ログアウトしました。"
    redirect_to "/tasks"
  end
end
