module AudioVision
  class Category

    attr_accessor \
      :id,
      :title,
      :slug,
      :description,
      :public_url


    def initialize(attributes={})
      @id           = attributes["id"]
      @title        = attributes["title"]
      @slug         = attributes["slug"]
      @description  = attributes["description"]
      @public_url   = attributes["public_url"]
    end
  end
end
