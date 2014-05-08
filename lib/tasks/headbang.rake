namespace :headbang do
  task :index => :environment do
    # ActiveRecord::Base.logger = Logger.new($stdout)
    Rails.application.eager_load!
    Jobist << DirectoryIndexService.new("/Volumes/Storage/Mp3")
    Jobist.shutdown
  end

  task :meta => :environment do
    Release.where(last_fm_id: nil).find_each do |release|
      Jobist << LastFm::ReleaseLookupService.new(release)
    end

    Artist.where(last_fm_id: nil).find_each do |release|
      Jobist << LastFm::ArtistLookupService.new(release)
    end

    Jobist.shutdown
  end

  def clean(value)
    Headbang::STOP_WORDS.reduce(value.downcase.gsub(/[^a-z0-9]+/, ' ').gsub(/\s+/, ' ')) { |ret, word| ret.gsub(/\b#{word}\b/, '') }.strip
  end
end
