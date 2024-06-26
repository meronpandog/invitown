class Public::PostCommentsController < ApplicationController
  # before_action :authenticate_customer!

  def create
    post = Post.find(params[:post_id])
    comment = current_customer.post_comments.new(post_comment_params)
    comment.post_id = post.id
    comment.save
    redirect_to request.referer
  end

  def destroy
    PostComment.find(params[:id]).destroy
    redirect_to request.referer
  end

private

  def post_comment_params
    params.require(:post_comment).permit(:comment, :star)
  end
end
