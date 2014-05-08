module Headbang
  module Controller
    module Scoping
      extend ActiveSupport::Concern

      def apply_scopes(target)
        scopes.inject(target) { |t, scope| apply_scope(t, scope) }
      end

      def apply_scope(target, scope)
        if scope.respond_to?(:call)
          instance_exec(target, &scope) || target
        else
          target.send(scope)
        end
      end

      def scopes
        @scopes ||= []
      end

      module ClassMethods
        def scope(*args, &block)
          if block
            before_action(*args) { scopes << block }
          else
            before_action(args.extract_options!) { scopes << args.first }
          end
        end
      end
    end
  end
end
