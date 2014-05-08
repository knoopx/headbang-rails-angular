class Genre < ActiveRecord::Base
  include Factory
  validates :name, presence: true
  has_many :releases, through: :genre_releases
end
