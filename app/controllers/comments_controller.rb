class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    @report = Report.find(params[:comment][:report_id])
    @comment = Comment.build(comment_params)
    @comment.save
    redirect_to report_path(@report.id), notice: t('controllers.common.notice_create', name: Comment.model_name.human)
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    # respond_to do |format|
    #   if @comment.update(comment_params)
    #     format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
    #   else
    #     format.html { render :edit }
    #   end
    # end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    # @comment.destroy
    # respond_to do |format|
    #   format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:body, :user_id, :report_id)
    end
end
