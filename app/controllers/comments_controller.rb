class CommentsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_comment, only: [:edit, :update, :show, :destroy]
  before_action :set_article, only: [:edit, :update, :show, :destroy, :create]
  authorize_resource :comment

  # GET /comments or /comments.json
  def index
    @comments = @article.commments.all.order('created_at desc')
  end

  # GET /comments/1 or /comments/1.json
  def show
    @comments = @article.commments.all.order('created_at desc')
  end

  # GET /comments/new
  def new
    @comment = @article.commments.build
  end

  # GET /comments/1/edit
  def edit
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
  end

  # POST /comments or /comments.json
  def create
    @comment = @article.comments.create(params[:comment].permit(:commentText, :article_id))
    @comment.user_id = current_user.id

    respond_to do |format|
      if @comment.save
        format.html { redirect_to article_path(@article), notice: "Comment was successfully created." }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1 or /comments/1.json
  def update
    @comment = @article.comments.find(params[:id])
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to article_path(@article), notice: "Comment was successfully updated." }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy

    @comment = @article.comments.find(params[:id])
    @comment.destroy
    #redirect_to article_path(@article)
    respond_to do |format|
      format.html { redirect_to article_path(@article), notice: "User was successfully destroyed." }
      format.json { head :no_content }
      format.js
    end

=begin
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to article_comment_path(@article), notice: "Comment was successfully destroyed." }
      format.json { head :no_content }
    end
=end
  end

  private
  def set_article
    @article = Article.find(params[:article_id])
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end



    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:commentText)
    end
end
