class ArtistsController < ApplicationController
  self.default_order = "name"

  def fetch
    respond_to do |format|
      format.json do
        Jobist << LastFm::ArtistLookupService.new(resource)

        resource.releases.each do |release|
          Jobist << LastFm::ReleaseLookupService.new(release)
        end
        render nothing: true, status: :no_content
      end
    end
  end

  def filter(scope, value)
    scope.where(Artist.arel_table[:name].matches("%#{value}%"))
  end

  def permitted_params
    params.permit(artist: :name)
  end
end
