class ReportsController < ApplicationController
  before_action :set_report, only: [:show, :edit, :update, :destroy]

  # GET /reports
  # GET /reports.json
  def index
    @reports = Report.all
  end

  # GET /reports/1
  # GET /reports/1.json
  def show
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

    respond_to do |format|
      if @report.save
        format.html { redirect_to @report, notice: t('controllers.common.notice_create', name: Report.model_name.human) }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /reports/1
  def update
    respond_to do |format|
      if current_user.reports.exists?(@report.id) && @report.update(report_params)
        format.html { redirect_to @report, notice: t('controllers.common.notice_update', name: Report.model_name.human) }
       else
         format.html { render :edit }
       end
    end
  end

  # DELETE /reports/1
  # DELETE /reports/1.json
  def destroy
    if current_user.reports.exists?(@report.id) && @report.destroy!
      respond_to do |format|
        format.html { redirect_to reports_url, notice: t('controllers.common.notice_destroy', name: Report.model_name.human) }
      end
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
