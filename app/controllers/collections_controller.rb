class CollectionsController < ApplicationController
  def filter(scope, value)
    scope.where(Collection.arel_table[:name].matches("%#{value}%"))
  end

  def permitted_params
    params.permit(collection: :name)
  end
end
