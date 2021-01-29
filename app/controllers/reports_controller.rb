# frozen_string_literal: true

class ReportsController < ApplicationController
  include Commentable

  before_action :set_report, only: %i[show edit update destroy]
  before_action :set_comments, only: %i[show]
  before_action :build_comment, only: %i[show]

  # GET /reports
  def index
    @reports = Report.includes(:user).order(:created_at).all
  end

  # GET /reports/1
  def show; end

  # GET /reports/new
  def new
    @report = Report.new
  end

  # GET /reports/1/edit
  def edit; end

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
  def destroy
    redirect_to reports_url, notice: t('controllers.common.notice_destroy', name: Report.model_name.human) if @report.user == current_user && @report.destroy!
  end

  private

  def resource
    @report
  end

  def set_report
    @report = Report.find(params[:id])
  end

  def report_params
    params.require(:report).permit(:title, :text)
  end
end
