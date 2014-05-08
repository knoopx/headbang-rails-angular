class Country < ActiveRecord::Base
  include Factory
  has_many :releases
end
