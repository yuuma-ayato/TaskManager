module Common
  extend ActiveSupport::Concern

  private
  def admin_only
    unless current_user && current_user.admin == true
      redirect_to tasks_path
      flash[:notice] = "あなたは管理者ではありません"
    end
  end
end
