class Public::HomesController < ApplicationController
  def top
    @anime_list = Anime.all
  end

  def about
  end
end
