module Headbang
  module Controller
    module Embedding
      extend ActiveSupport::Concern

      def embed?(resource)
        embeds.include?(resource)
      end

      def embed(resource)
        embeds << resource
      end

      def embeds
        @embeds ||= Set.new
      end

      module ClassMethods
        def embeds(resource, &block)
          scope(only: [:show, :index]) do |scope|
            if Array.wrap(params.fetch(:embed, [])).include?(resource.to_s)
              embed(resource)
              instance_exec(scope, &block)
            end
          end
        end
      end
    end
  end
end
