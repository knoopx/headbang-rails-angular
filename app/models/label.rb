class Label < ActiveRecord::Base
  include Factory

  validates :name, presence: true
  has_many :releases, through: :label_releases
end
