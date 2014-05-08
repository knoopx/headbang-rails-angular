class Source < ActiveRecord::Base
  validates :path, presence: true
  validate { errors.add(:path, :invalid) unless Dir.exist?(self.path) }
end
