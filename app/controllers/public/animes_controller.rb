class Public::AnimesController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def index
    @anime_list = current_user.animes
  end

  def new
    @anime = Anime.new
    # 全タグを取得
    @tags = ActsAsTaggableOn::Tag.all
  end

  def create
    @anime = current_user.animes.new(anime_params)
    if @anime.save
      redirect_to anime_path(@anime)
    else
      @tags = ActsAsTaggableOn::Tag.all
      render :new
    end
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
    if @anime.update(anime_params)
      redirect_to anime_path(@anime.id)
    else
      @tags = ActsAsTaggableOn::Tag.all
      render :edit
    end
  end

  private

  def anime_params
    params.require(:anime).permit(:genre_id, :name, :image, :introduction, tag_list: [])
  end
end
