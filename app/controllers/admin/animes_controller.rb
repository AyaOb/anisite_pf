class Admin::AnimesController < ApplicationController
  before_action :authenticate_admin!
  def show
    @anime = Anime.find(params[:id])
    @comments = @anime.comments
  end

  def update
    @anime = Anime.find(params[:id])
    if @anime.is_active
      @anime.update(is_active: false)
    else
      @anime.update(is_active: true)
    end
    redirect_to admin_anime_path(@anime)
  end
end
