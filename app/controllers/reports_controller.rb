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


  end

  def index
  end

  def destroy
  end
end
