module Scoping
  extend ActiveSupport::Concern

  private

  def apply_scopes(target)
    __scopes.each do |scope|
      target = apply_scope(target, scope)
    end
    target
  end

  def apply_scope(target, scope)
    if scope.respond_to?(:call)
      instance_exec(target, &scope) || target
    else
      target.send(scope)
    end
  end

  def __scopes
    @__scopes ||= []
  end

  module ClassMethods
    def scope(*args, &block)
      if block_given?
        before_filter(*args) { __scopes << block }
      else
        opts = args.extract_options!
        before_filter(opts) { __scopes << args.first }
      end
    end
  end
end
