class PostCommentsController < ApplicationController
  def create
    @lanobe = Lanobe.find(params[:lanobe_id])
    @post_comment = PostComment.new
    comment = current_user.post_comments.new(post_comment_params)
    comment.lanobe_id = @lanobe.id
    comment.save
  end

  def destroy
    @post_comment = PostComment.new
    @lanobe = Lanobe.find(params[:lanobe_id])
    PostComment.find_by(id: params[:id], lanobe_id: params[:lanobe_id]).destroy
  end

  def post_comment_params
    params.require(:post_comment).permit(:comment, :user_id, :lanobe_id)
  end
end
