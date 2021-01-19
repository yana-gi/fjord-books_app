class ReportsController < ApplicationController
  before_action :set_report, only: %i[show edit update destroy]
  before_action :set_commentable, only: :show

  # GET /reports
  # GET /reports.json
  def index
    @reports = Report.includes(:user).order(:created_at).all
  end

  # GET /reports/1
  # GET /reports/1.json
  def show
    @comments = @commentable.comments.includes(:user).all
    @comment = @commentable.comments.build(user_id: current_user.id)
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
    @report.save
    redirect_to @report, notice: t('controllers.common.notice_create', name: Report.model_name.human)
  end

  # PATCH/PUT /reports/1
  def update
    # respond_to do |format|
    #   if @report.user == current_user && @report.update(report_params)
    #     format.html { redirect_to @report, notice: t('controllers.common.notice_update', name: Report.model_name.human) }
    #    else
    #      format.html { render :edit }
    #    end
    # end
  end

  # DELETE /reports/1
  # DELETE /reports/1.json
  def destroy
    # if @report.user == current_user && @report.destroy!
    #   respond_to do |format|
    #     format.html { redirect_to reports_url, notice: t('controllers.common.notice_destroy', name: Report.model_name.human) }
    #   end
    # end
  end

  private
  def set_commentable
    resource, id = request.path.split('/')[1,2]
    @commentable = resource.singularize.classify.constantize.find(id)
  end

    # Use callbacks to share common setup or constraints between actions.
  def set_report
    @report = Report.find(params[:id])
  end

    # Only allow a list of trusted parameters through.
  def report_params
    params.require(:report).permit(:title, :text)
  end
end
