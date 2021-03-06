class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def index
    @comments = Comment.all
    respond_with @comments
  end

  def show
    respond_with @comment
  end

  def new
    @comment = Comment.new
  end

  def edit
  end

  def create
    @comment = Comment.new(comment_params)

    respond_with do |format|
      if @comment.save
        track
        format.html { redirect_to @comment, notice: 'Comment was successfully created.' }
        format.json { render json: @comment, status: :created }
      else
        format.html { render action: 'new' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
        format.js {head :unprocessable_entity }
      end
    end
  end

  def update
    respond_with do |format|
      if @comment.update(comment_params)
        track
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
        format.js {head :unprocessable_entity}
      end
    end
  end

  def destroy
    @comment.destroy
    track
    respond_with do |format|
      format.html { redirect_to comments_url }
      format.json { head :no_content }
    end
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:content, :todo_id, :user_id)
    end

    def track
      track_event(@comment, @comment.todo.project_id)
    end
end
