class Admin::LabelsController < ApplicationController
  include Common
  before_action :admin_only
  def index
    @labels = Label.all
  end

  def new
    @label = Label.new
  end

  def create
    @label = Label.new(label_params)
    if @label.save
      redirect_to admin_labels_path
      flash[:notice] = "ラベルを作成しました"
    else
      render :new
    end
  end

  private
  def label_params
    params.require(:label).permit(:label_name,:color)
  end
end
