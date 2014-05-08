module LastFm
  class ArtistLookupService
    include Jobist::Job
    self.queue = :last_fm

    def initialize(artist)
      @artist = artist
    end

    def call
      response = LastFm::Artist.get_info(artist: @artist.name, autocorrect: true)
      response.artist && response.artist.tap do |result|
        Headbang.synchronize do
          if artist = ::Artist.where.not(id: @artist.id).find_by(name: result.name)
            artist.update_attributes(artist_attributes(result))
            @artist.releases.update_all(artist_id: artist.id)
          else
            @artist.update_attributes(artist_attributes(result))
          end
        end
      end
    end

    def artist_attributes(artist)
      {
        music_brainz_id: artist.mbid,
        last_fm_url: artist.url,
        last_fm: artist
      }
    end


    def images(result)
      result.image.each_with_object({}) { |image, h| h[image["size"]] = image["#text"] }
    end

    def image_url(result)
      images(result)["extralarge"]
    end
  end
end
