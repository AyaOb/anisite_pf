class Public::LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = Comment.find(params[:comment_id])
    @anime = @comment.anime
    like = current_user.likes.new(comment_id: @comment.id)
    like.save
  end

  def destroy
    @comment = Comment.find(params[:comment_id])
    @anime = @comment.anime
    like = current_user.likes.find_by(comment_id: @comment.id)
    like.destroy
  end
end
