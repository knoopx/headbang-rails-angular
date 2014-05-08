class DirectoryEntry
  attr_accessor :name, :path

  def initialize(path)
    @path = path
  end

  class << self
    def all(path)
      Dir.glob(File.join(File.expand_path(path), "*"), File::FNM_DOTMATCH).select { |p| File.directory?(p) }.map { |d| self.new(d) }
    end
  end
end
