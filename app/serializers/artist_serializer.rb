class ArtistSerializer < Headbang::Serializer
  attributes :id, :name, :image_url, :biography, :releases_count

  def biography
    last_fm && last_fm.bio && last_fm.bio.summary && last_fm.bio.summary.strip
  end

  def image_url
    last_fm && last_fm.image && last_fm.image.each_with_object({}) { |image, h| h[image["size"]] = image["#text"] }["extralarge"]
  end

  protected

  def last_fm
    Hashie::Mash.new(resource.last_fm)
  end
end
