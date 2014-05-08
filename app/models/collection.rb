class Collection < ActiveRecord::Base
  validates :name, presence: true
  has_and_belongs_to_many :releases
  has_many :tracks, through: :releases
end
