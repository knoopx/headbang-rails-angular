class TrackSerializer < Headbang::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :number, :title, :release_title, :release_id, :artist_name, :length, :bitrate, :src, :type

  def release_title
    resource.release.title
  end

  def artist_name
    resource.artist ? resource.artist.name : resource.release.artist.name
  end

  def src
    track_path(resource, format: "mp3")
  end

  def type
    Mime::Type.lookup_by_extension(File.extname(resource.path).downcase.delete('.')).to_s
  end
end
