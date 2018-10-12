class GifsController < ApplicationController
  def index
    @veneration = Veneration.where(score: params[:score]).order("RANDOM()").first
    render json: {
      contributor: @veneration.user.name,
      caption: @veneration.caption,
      image: url_for(@veneration.image),
    }
  end
end
