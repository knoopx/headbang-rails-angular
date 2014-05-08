class TrackIndexService
  include Jobist::Job
  self.queue = :index

  def initialize(path)
    @path = path
  end

  def call
    ::Track.factory!(:path, track_attributes)
  ensure
    fileref.close if fileref
  end

  def dirname
    File.dirname(@path)
  end

  def track_attributes
    {
      title: tag.title,
      number: tag.track,
      bitrate: audio_properties.bitrate,
      length: audio_properties.length,
      artist: artist,
      release: release,
      path: @path
    }
  end

  def release
    @release ||= begin
      Release.factory!(:path, release_attributes)
    end
  end

  def release_attributes
    {
      title: tag.album,
      artist: artist,
      year: tag.year,
      path: dirname
    }
  end

  def artist
    @artist ||= Artist.factory!(:name, artist_attributes)
  end

  def artist_attributes
    {
      name: tag.artist
    }
  end

  def fileref
    @fileref ||= TagLib::FileRef.new(@path)
  end

  def audio_properties
    @audio_properties ||= fileref.audio_properties
  end

  def tag
    @tag ||= fileref.tag
  end
end
