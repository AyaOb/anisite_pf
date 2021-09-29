class Public::AnimesController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def index
    # @anime_list = current_user.animes
    @tags = ActsAsTaggableOn::Tag.all
    # タグの一覧表示
    if params[:tag]
        @anime_list = Anime.tagged_with(params[:tag])
    else
      @anime_list = current_user.animes
    end
  end

  def new
    @anime = Anime.new
    @tags = ActsAsTaggableOn::Tag.all
  end

  def create
    @anime = current_user.animes.new(anime_params)
    @anime.save
    redirect_to anime_path(@anime)
  end

  def show
    @anime = Anime.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @anime = Anime.find(params[:id])
    @tags = ActsAsTaggableOn::Tag.all
  end

  def update
    @anime = Anime.find(params[:id])
    @anime.update(anime_params)
    redirect_to anime_path(@anime.id)
  end

  private

  def anime_params
    params.require(:anime).permit(:genre_id, :name, :image, :introduction, tag_list: [])
  end
end
