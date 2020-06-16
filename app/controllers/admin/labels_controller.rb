class Admin::LabelsController < ApplicationController
  before_action :admin_only
  def index
    @labels = Label.all
  end

  private
  def admin_only
    unless current_user && current_user.admin == true
      redirect_to tasks_path
      flash[:notice] = "あなたは管理者ではありません"
    end
  end
end
