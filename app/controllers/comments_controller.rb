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
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])

    if @comment.user_id == current_user.id
      @comment.update(comment_params)
      @comment.user_id = current_user.id
      @comment.save
      redirect_to project_path(@comment.project_id)
    else
      redirect_to project_path(@comment.project_id), notice: 'You are not authorized to edit or delete this comment'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.user_id == current_user.id
      @comment.destroy
      redirect_to project_path(@comment.project_id)
    else
      redirect_to project_path(@comment.project_id), notice: 'You are not authorized to edit or delete this comment'
    end 
  end

  private

  def comment_params
    params.require(:comment).permit(:description, :project_id, :user_id)
  end
end
