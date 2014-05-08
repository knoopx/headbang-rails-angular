class Release < ActiveRecord::Base
  include Factory

  validates :title, presence: true
  belongs_to :country, counter_cache: true
  belongs_to :artist, counter_cache: true
  has_many :tracks

  has_many :releases
  belongs_to :release
  has_many :genre_releases
  has_many :label_releases
  has_many :genres, through: :genre_releases
  has_many :labels, through: :label_releases
  has_and_belongs_to_many :collections

  def artwork
    @artwork ||= Artwork.new(self.path)
  end
end
