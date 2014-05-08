class GenresController < ApplicationController
  def filter(scope, value)
    scope.where(Genre.arel_table[:name].matches("%#{value}%"))
  end
end
