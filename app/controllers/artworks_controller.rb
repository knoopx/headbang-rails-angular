class ArtworksController < ApplicationController
  defaults singleton: true
  belongs_to :release

  def show
    respond_to do |format|
      format.jpg { send_data(parent.artwork.file) }
    end
  end
end
