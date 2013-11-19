module AudioVision
  class Post < Base

    class << self
      def api_namespace
        :posts
      end


      # Find a Post by its URL.
      # Returns a Post if success, otherwise nil.
      #
      # Example:
      #    AudioVision::Post.find_by_url(
      #     "http://audiovision.scpr.org/321/the-night-watch"
      #    )
      #
      #    #=> #<AudioVision::Post>
      def find_by_url(url)
        response = client.get(endpoint("by_url"), :url => url)

        if response.success?
          new(response.body)
        else
          nil
        end
      end
    end


    attr_accessor \
      :id,
      :title,
      :teaser,
      :body,
      :published_at,
      :thumbnail,
      :assets,
      :category,
      :byline,
      :attributions,
      :public_url


    def initialize(attributes={})
      @id           = attributes["id"]
      @title        = attributes["title"]
      @teaser       = attributes["teaser"]
      @body         = attributes["body"]
      @thumbnail    = attributes["thumbnail"]
      @byline       = attributes["byline"]
      @public_url   = attributes["public_url"]

      if attributes["category"]
        @category = Category.new(attributes["category"])
      end

      if attributes["published_at"]
        @published_at = Time.parse(attributes["published_at"].to_s)
      end

      @attributions = []
      Array(attributes["attributions"]).each do |json|
        @attributions << Attribution.new(json)
      end

      @assets = []
      Array(attributes["assets"]).each do |json|
        @assets << Asset.new(json)
      end
    end
  end
end
