class GifsController < ApplicationController
  def index
    @veneration = Veneration.where(score: params[:score]).order("RANDOM()").first
    render json: {
      caption: @veneration.caption,
      image: url_for(@veneration.image),
    }
  end
end
