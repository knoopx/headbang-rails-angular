class Artwork
  def initialize(path)
    @path = path
  end

  def file
    Dir.glob(File.join(@path, "*.jpg")).first
  end
end
