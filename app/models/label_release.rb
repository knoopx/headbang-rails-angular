class LabelRelease < ActiveRecord::Base
  belongs_to :label, counter_cache: "releases_count"
  belongs_to :release, counter_cache: "labels_count"
end
