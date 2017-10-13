class CommentsController < ApplicationController

  def new
    @comment = Comment.new(project_id: params[:project_id])
  end

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      @comment.user_id = current_user.id
      @comment.save
      redirect_to project_path(@comment.project_id)
    else
      render :new
    end
  end

  def edit
    @comment = Comment.find(params[:project_id])
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    redirect_to project_path(@comment.project_id)
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to project_comments_path
  end

  private

  def comment_params
    params.require(:comment).permit(:description, :project_id, :user_id)
  end
end
