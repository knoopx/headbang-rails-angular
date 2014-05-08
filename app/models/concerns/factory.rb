module Factory
  extend ActiveSupport::Concern

  module ClassMethods
    def factory!(column, attributes, &block)
      instance = self.new(attributes)
      Headbang.synchronize do
        self.where(column => instance.read_attribute(column)).first || begin
          instance.save!
          instance
        end
      end
    end
  end
end
