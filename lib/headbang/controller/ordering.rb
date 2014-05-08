module Headbang
  module Controller
    module Ordering
      extend ActiveSupport::Concern

      included do
        class_attribute :default_order
        scope do |s|
          if value = params.fetch(:order, self.class.default_order)
            s.order(value)
          end
        end
      end
    end
  end
end
