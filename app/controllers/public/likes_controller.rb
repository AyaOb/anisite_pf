class Public::LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    comment = Comment.find(params[:comment_id])
    like = current_user.likes.new(comment_id: comment.id)
    like.save
    redirect_to anime_path(comment.anime)
  end

  def destroy
    comment = Comment.find(params[:comment_id])
    like = current_user.likes.find_by(comment_id: comment.id)
    like.destroy
    redirect_to anime_path(comment.anime)
  end
end
