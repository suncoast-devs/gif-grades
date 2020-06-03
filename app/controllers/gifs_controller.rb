class GifsController < ApplicationController
  def index
    # Get venerations only where we have an actual gif content type
    venerations = Veneration.where(score: params[:score]).joins(:image_blob)

    # If we specify a particular content-type then apply that restriction too
    if params[:content_type]
      venerations = venerations.where("active_storage_blobs.content_type = ?", params[:content_type])
    end

    # Limit them to a max_byte_size if specified
    if params[:max_byte_size]
      max_byte_size = params[:max_byte_size].to_i
      venerations = venerations.where("active_storage_blobs.byte_size < ?", max_byte_size)
    end

    # And get a random image
    veneration = venerations.order("RANDOM()").first

    if veneration
      render json: {
        contributor: veneration.user.name,
        caption: veneration.caption,
        image: url_for(veneration.image),
        url: url_for(veneration),
      }
    else
      head :no_content
    end
  end
end
