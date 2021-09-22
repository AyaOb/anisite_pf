class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  def top
    @anime_list = Anime.all
  end
end
