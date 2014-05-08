class TracksController < ApplicationController
  belongs_to :release, optional: true
  belongs_to :artist, optional: true
  belongs_to :collection, optional: true

  scope do |s|
    s.joins(:release => :artist).
      order(Artist.arel_table[:name]).
      order(Release.arel_table[:title]).
      order(Track.arel_table[:number])
  end

  def show
    super do |format|
      format.json
      format.mp3 do
        resource.increment!(:play_count)
        resource.release.increment!(:play_count)
        resource.artist.increment!(:play_count)
        stream_file(resource.path)
      end
    end
  end

  protected

  def stream_file(path)
    response.header["Accept-Ranges"] = "bytes"

    size = File.size(path)
    if request.headers["HTTP_RANGE"]
      ranges = Rack::Utils.byte_ranges(request.headers, size)
      if ranges
        range = ranges.first
        offset = range.begin
        length = range.end - range.begin + 1

        response.header["Content-Range"] = "bytes #{range.begin}-#{range.end}/#{size}"

        send_data IO.binread(path, length, offset), stream: true, status: 206
      else
        render status: 416
      end
    else
      send_file(path, stream: true)
    end
  end
end
