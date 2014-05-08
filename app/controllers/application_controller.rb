class ApplicationController < Headbang::Controller::Base
  include Headbang::Controller::Scoping
  include Headbang::Controller::Embedding
  include Headbang::Controller::Ordering

  scope { |s| s.limit(params.fetch(:limit, 50)) }
  scope { |s| s.offset(params[:offset]) if params[:offset] }

  scope(only: :index) { |s| filter(s, params[:filter]) if params[:filter] }
end
