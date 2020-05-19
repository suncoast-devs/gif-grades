class GifsController < ApplicationController
  def index
    venerations = Veneration.where(score: params[:score])

    if params[:max_byte_size]
      max_byte_size = params[:max_byte_size].to_i
      venerations = venerations.joins(:image_blob).where("active_storage_blobs.byte_size < ?" , max_byte_size)
    end

    veneration = venerations.order("RANDOM()").first

    if veneration
      render json: {
        contributor: veneration.user.name,
        caption: veneration.caption,
        image: url_for(veneration.image),
        url: url_for(veneration)
      }
    else
      head :no_content
    end
  end
end
