class Admin::LabelsController < ApplicationController
  include Common
  before_action :admin_only
  before_action :set_label, only: %i(edit update destroy)
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

  def edit
  end

  def update
    if @label.update(label_params)
      redirect_to admin_labels_path
      flash[:notice] = "ラベルを編集しました"
    else
      render :edit
    end
  end

  def destroy
    @label.destroy
    redirect_to admin_labels_path
    flash[:notice] = "ラベルを削除しました"
  end

  private

  def set_label
    @label = Label.find(params[:id])
  end

  def label_params
    params.require(:label).permit(:label_name,:color)
  end
end
