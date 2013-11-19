module AudioVision
  class Attribution

    attr_accessor \
      :name,
      :url,
      :role_text,
      :role


    def initialize(attributes={})
      @name       = attributes["name"]
      @url        = attributes["url"]
      @role_text  = attributes["role_text"]
      @role       = attributes["role"]
    end
  end
end
