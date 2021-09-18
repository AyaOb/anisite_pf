class Public::AnimesController < ApplicationController
  def index
  end

  def new
    @anime = Anime.new
  end

  def create
    @anime = Anime.new(anime_params)
    @anime.save
    redirect_to anime_path
  end

  def show
    @anime = Anime.find(params[:id])
  end

  def edit
    @anime = Anime.find(params[:id])
  end

  def update
    @anime = Anime.find(params[:id])
    @anime.update(anime_params)
    redirect_to anime_path
  end

  private

  def anime_params
    params.require(:anime).permit(:genre_id, :name, :image, :introduction)
  end
end
