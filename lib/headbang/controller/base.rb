module Headbang
  module Controller
    class Base < ActionController::Base
      def self.inherited(base)
        super(base)
        base.class_eval do
          include InheritedResources::Actions
          include InheritedResources::BaseHelpers
          extend InheritedResources::ClassMethods
          extend InheritedResources::UrlHelpers

          helper_method :resource, :collection, :resource_class, :association_chain,
            :resource_instance_name, :resource_collection_name,
            :resource_url, :resource_path,
            :collection_url, :collection_path,
            :new_resource_url, :new_resource_path,
            :edit_resource_url, :edit_resource_path,
            :parent_url, :parent_path,
            :smart_resource_url, :smart_collection_url

          self.class_attribute :resource_class, :instance_writer => false unless self.respond_to? :resource_class
          self.class_attribute :parents_symbols, :resources_configuration, :instance_writer => false

          protected :resource_class, :parents_symbols, :resources_configuration,
            :resource_class?, :parents_symbols?, :resources_configuration?

          initialize_resources_class_accessors!
          create_resources_url_helpers!

          include Headbang::Serialization

          respond_to :json
          self.responder = Headbang::Responder
        end
      end

      def serialization_context
        self
      end
    end
  end
end
