class Track < ActiveRecord::Base
  include Factory
  belongs_to :release
  belongs_to :artist
  validates :title, :release, presence: true
end
