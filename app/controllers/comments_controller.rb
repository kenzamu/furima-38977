class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    redirect_to item_path(params[:item_id])
  end

  private
  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
