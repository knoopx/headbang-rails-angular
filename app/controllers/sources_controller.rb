class SourcesController < ApplicationController
  self.default_order = "created_at"

  def scan
    Source.find_each { |source| Jobist << DirectoryIndexService.new(source.path) }
    render nothing: true, status: :accepted
  end

  protected

  def permitted_params
    params.permit(source: :path)
  end
end
