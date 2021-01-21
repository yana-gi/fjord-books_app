class ReportsController < ApplicationController
  before_action :set_report, only: %i[show edit update destroy]
  1
  # GET /reports
  # GET /reports.json
  def index
    @reports = Report.includes(:user).order(:created_at).all
  end

  # GET /reports/1
  # GET /reports/1.json
  def show
    @comments = @report.comments.includes(:user).all
    @comment = @report.comments.build(user_id: current_user.id)
  end

  # GET /reports/new
  def new
    @report = Report.new
  end

  # GET /reports/1/edit
  def edit
  end

  # POST /reports
  def create
    @report = current_user.reports.new(report_params)
    if @report.save
      redirect_to @report, notice: t('controllers.common.notice_create', name: Report.model_name.human)
    else
      render :new
    end
  end

  # PATCH/PUT /reports/1
  def update
    if @report.user == current_user && @report.update(report_params)
      redirect_to @report, notice: t('controllers.common.notice_update', name: Report.model_name.human)
    else
      render :edit
    end
  end

  # DELETE /reports/1
  # DELETE /reports/1.json
  def destroy
    if @report.user == current_user && @report.destroy!
      redirect_to reports_url, notice: t('controllers.common.notice_destroy', name: Report.model_name.human)
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_report
    @report = Report.find(params[:id])
  end

    # Only allow a list of trusted parameters through.
  def report_params
    params.require(:report).permit(:title, :text)
  end
end
