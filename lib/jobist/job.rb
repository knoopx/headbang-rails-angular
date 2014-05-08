module Jobist
  module Job
    extend ActiveSupport::Concern
    included { class_attribute :queue }
  end
end
