class DirectoryEntrySerializer < Headbang::Serializer
  attributes :name, :path

  def name
    @name ||= File.basename(resource.path)
  end
end
