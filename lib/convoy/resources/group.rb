module Convoy
  class Group < ApiResource
    include ApiOperations::Get
    include ApiOperations::Save
    include ApiOperations::Delete
    include ApiOperations::List
    extend ApiOperations::Create

    def initialize(id = nil, config = Convoy.config, **kwargs)
      @id = id
      @data = kwargs[:data].nil? ? {} : kwargs[:data]
      @config = config
    end

    def resource_url
      unless @id.nil?
        return "#{@config.base_uri}/#{@config.path_version}/groups"
      end

      "#{@config.base_uri}/#{@config.path_version}/groups" + "/#{@id}"
    end

  end
end
