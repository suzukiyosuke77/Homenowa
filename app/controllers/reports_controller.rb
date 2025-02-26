class ReportsController < ApplicationController
  before_action :set_post, only: [:create]

  def create
    @report = @post.reports.new(report_params)
    @report.user = current_user

    if @report.save
      flash[:notice] = "通報を受け付けました"
    else
      flash[:alert] = "通報に失敗しました..."
    end
    redirect_to post_path(@post)
  end

  #管理者通報機能
  def index
    if current_user.admin?
      @reports = Report.order(created_at: :desc)
    else
      redirect_to root_path, alert: "アクセス権がありません"
    end
  end

  def destroy
    @report = Report.find(params[:id])
    if current_user.admin?
      @report.destroy
      flash[:notice] = "通報を削除しました。"
    else
      flash[:alert] = "アクセス権がありません。"
    end
    redirect_to reports_path
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def report_params
    params.require(:report).permit(:reason)
  end
end
