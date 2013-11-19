module AudioVision
  class Asset

    class Size
      attr_accessor :width, :height, :url

      def initialize(attributes={})
        @width    = attributes['width']
        @height   = attributes['height']
        @url      = attributes['url']
      end
    end


    ATTRIBUTES = [
      :caption,
      :owner,
      :title
    ]

    SIZES = [
      :thumbnail,
      :small,
      :large,
      :full
    ]

    attr_accessor *(ATTRIBUTES + SIZES)

    def initialize(attributes={})
      @caption  = attributes["caption"]
      @owner    = attributes["owner"]
      @title    = attributes["title"]

      SIZES.each do |size|
        self.send("#{size}=", Asset::Size.new(attributes[size.to_s]))
      end
    end
  end
end
