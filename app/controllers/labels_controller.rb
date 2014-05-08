class LabelsController < ApplicationController
  def filter(scope, value)
    scope.where(Label.arel_table[:name].matches("%#{value}%"))
  end
end
