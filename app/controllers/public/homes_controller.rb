class Public::HomesController < ApplicationController
  def top
    @anime_list = Anime.all
  end

  def about
  end

  def search
    @anime_list = Anime.search(params[:keyword])
    @keyword = params[:keyword]
    render "top"
  end
end
