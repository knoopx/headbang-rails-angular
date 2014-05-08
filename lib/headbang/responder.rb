module Headbang
  class Responder < ActionController::Responder
    delegate :serialize, to: :controller

    def display(resource, opts = {})
      response = serialize(resource).as_json
      super(response, opts)
    end
  end
end
