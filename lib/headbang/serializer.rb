module Headbang
  class Serializer < SimpleDelegator
    include Headbang::Serialization

    attr_reader :context

    def initialize(resource, context = self, opts = {})
      @resource = resource, @context = context
      @options = opts
      super(resource)
    end

    alias_method :resource, :__getobj__

    def as_json(opts = {})
      serializable_keys.each_with_object({}) do |(name, key_opts), hash|
        serialization_opts = key_opts.dup.merge(opts)
        key = serialization_opts.delete(:as) || name

        if serialize_key?(serialization_opts.delete(:if) || true)
          case serialization_opts.delete(:type)
            when :association
              value = serialize(send(name), serialization_opts)
            else
              value = send(name)
          end
          hash[key] = value
        end
      end
    end

    def serialize_key?(condition)
      if condition.respond_to?(:call)
        context.instance_exec(&condition)
      elsif condition.is_a?(Symbol)
        context.send(condition)
      else
        condition
      end
    end

    def serialization_context
      context.serialization_context
    end

    class << self
      def attribute(name, opts = {}, &block)
        self.serializable_keys = serializable_keys.dup
        serializable_keys[name] = opts
        define_method(name, &block) if block
      end

      def attributes(*names)
        opts = names.extract_options!
        names.each { |name| attribute(name, opts) }
      end

      def association(name, opts = {})
        attribute(name, opts.merge(type: :association))
      end

      def associations(*associations)
        opts = associations.extract_options!
        associations.each { |name| association(name, opts) }
      end
    end

    private

    class_attribute :serializable_keys
    self.serializable_keys = {}
  end
end
