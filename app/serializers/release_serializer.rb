class ReleaseSerializer < Headbang::Serializer
  attributes :id, :title, :tracks_count, :play_count, :artwork_url, :year, :path, :name

  attribute :collection_ids, if: -> { embed?(:collections) }
  association :tracks, if: -> { embed?(:tracks) }
  association :artist

  def name
    File.basename(resource.path)
  end

  def path
    File.dirname(resource.path)
  end
end
