# frozen_string_literal: true

class PostCommentsController < ApplicationController
  # ログインしていないとURLを入力しても表示されないようにする。
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @post_comment = current_user.post_comments.new(post_comment_params)
    @post_comment.post_id = @post.id
    flash[:success] = 'コメントしました。' if @post_comment.save
    redirect_to request.referer
  end

  def destroy
    PostComment.find_by(id: params[:id], post_id: params[:post_id]).destroy
    redirect_to request.referer
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
