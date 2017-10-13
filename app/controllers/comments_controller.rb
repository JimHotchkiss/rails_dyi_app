class CommentsController < ApplicationController

  def new
    @comment = Comment.new(project_id: params[:project_id])
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to project_path(@comment.project_id)
    else
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:description, :project_id)
  end
end
