class Public::HomesController < ApplicationController
  def top
    # 全タグを取得
    @tags = ActsAsTaggableOn::Tag.all
    # タグ検索/ジャンル検索/アニメ一覧表示
    if params[:tag_name]
      @anime_list = Anime.tagged_with(params[:tag_name])
      @name = params[:tag_name]
    elsif params[:genre_id]
      @name = Genre.find(params[:genre_id]).name
      @anime_list = Anime.where(genre_id: params[:genre_id])
    else
      @genre_list = Genre.all
      @anime_list = Anime.all
    end
  end

  def about
  end

  def search
    @anime_list = Anime.search(params[:keyword])
    @keyword = params[:keyword]
    render "top"
  end
end
