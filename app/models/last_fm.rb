module LastFm
  class Base
    include HTTParty
    include Hashie

    base_uri 'http://ws.audioscrobbler.com/2.0/'
    class_attribute :api_key

    class << self
      def request(path, opts = {})
        response = get(path, query: opts.reverse_merge(format: "json", api_key: api_key))
        case response.response
          when Net::HTTPOK
            Hashie::Mash.new(response)
          else
            raise ArgumentError, response.parsed_response
        end
      end
    end
  end

  %w(artist.getInfo artist.getSimilar artist.getCorrection album.getInfo).each do |method|
    resource_name, method_name = method.split(".", 2)
    klass = const_defined?(resource_name.camelize, false) ? const_get(resource_name.camelize, false) : const_set(resource_name.camelize, Class.new(LastFm::Base))
    klass.define_singleton_method(method_name.underscore) do |args = {}|
      request '/', args.merge(method: method)
    end
  end
end
