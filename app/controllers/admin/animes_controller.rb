class Admin::AnimesController < ApplicationController
  before_action :authenticate_admin!
  def show
    @anime = Anime.find(params[:id])
    @comments = @anime.comments
  end

  def edit
  end

  def update
  end
end
