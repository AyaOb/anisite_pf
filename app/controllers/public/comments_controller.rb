class Public::CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    anime = Anime.find(params[:anime_id])
    comment = current_user.comments.new(comment_params)
    comment.anime_id = anime.id
    comment.save
    redirect_to anime_path(anime.id)
  end

  def destroy
    comment = Comment.find(params[:id]).destroy
    redirect_to anime_path(params[:anime_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
