class Artist < ActiveRecord::Base
  include Factory
  validates :name, presence: true
  has_many :releases
  has_many :tracks, through: :releases

  store :last_fm
  store :music_brainz
  store :discogs

  def similar_artists
    Artist.where(name: !last_fm.similar.blank? && last_fm.similar.artist.map(&:name))
  end

  def last_fm
    Hashie::Mash.new(super)
  end
end
