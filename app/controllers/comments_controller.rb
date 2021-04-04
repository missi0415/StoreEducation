class CommentsController < ApplicationController
    def create
    group_message = GroupMessage.find(params[:group_message_id])
    comment = current_user.comments.new(comment_params)
    comment.group_message_id = group_message.id
    comment.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    PostComment.find_by(id: params[:id], group_message_id: params[:group_message_id]).destroy
    redirect_to group_message_path(params[:group_message_id]) 
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
