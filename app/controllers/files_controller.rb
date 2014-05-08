class FilesController < Headbang::Controller::Base
  include Headbang::Controller::Scoping
  defaults resource_class: DirectoryEntry
  actions :index

  def collection
    DirectoryEntry.all(params.fetch(:path, "~"))
  end
end
