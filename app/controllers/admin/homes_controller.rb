class Admin::HomesController < ApplicationController
  def top
    @anime_list = Anime.all
  end
end
