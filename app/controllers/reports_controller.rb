class ReportsController < ApplicationController

  
  def create
    @report = @post.reports.new(report_params)
    @report.user = current_user

    if @report.save
      flash[:notice] = "通報を受け付けました"
    else
      flash[:alert] = "通報に失敗しました..."
    end
    redirect_to @post
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
  end
end
