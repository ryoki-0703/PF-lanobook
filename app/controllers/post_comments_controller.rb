class PostCommentsController < ApplicationController
  def create
    lanobe = Lanobe.find(params[:lanobe_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.lanobe_id = lanobe.id
    comment.save
    redirect_to lanobe_path(lanobe)
  end

  def destroy
    PostComment.find_by(id: params[:id], lanobe_id: params[:lanobe_id]).destroy
    redirect_to lanobe_path(params[:lanobe_id])
  end

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
