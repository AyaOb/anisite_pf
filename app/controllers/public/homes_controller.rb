class Public::HomesController < ApplicationController
  def top
    # 全タグを取得
    @tags = ActsAsTaggableOn::Tag.all
    # タグ情報の有無
    if params[:tag_name]
        @anime_list = Anime.tagged_with(params[:tag_name])
    else
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
