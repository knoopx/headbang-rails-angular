class GenreRelease < ActiveRecord::Base
  belongs_to :genre, counter_cache: "releases_count"
  belongs_to :release, counter_cache: "genres_count"
end
