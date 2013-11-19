require 'time'

module AudioVision
  # This is a private class and shouldn't be used directly.
  # It acts as a base class for all of the AudioVision classes which
  # are available in the API.
  class Base

    class << self
      # Returns the API path for this class.
      # Example: /api/v1/posts
      def api_path
        @api_path ||= [AudioVision.api_root, self.api_namespace].join("/")
      end

      # Find an object by its ID.
      # Returns the object if found, otherwise false.
      #
      # Example:
      #    AudioVision::Post.find(10) #=> #<AudioVision::Post>
      def find(id)
        response = client.get(endpoint(id))

        if response.success?
          new(response.body)
        else
          false
        end
      end


      # Get a collection of posts.
      # Passed-in parameters are passed directly to the API.
      # Returns an array of Posts.
      #
      # Example:
      #   AudionVision::Post.collection(limit: 5, query: "Photos") #=> [ ... ]
      def collection(options={})
        response = client.get(api_path, options)

        if response.success?
          collection = []

          response.body.each do |json|
            collection << new(json)
          end

          collection
        else
          []
        end
      end


      private

      def endpoint(*segments)
        [self.api_namespace, *segments].join("/")
      end

      def client
        @client ||= AudioVision::Client.new
      end
    end


    # Steal the ActiveRecord behavior for object comparison.
    # If they're the same class and the ID is the same, then it's "same"
    # enough for us.
    def ==(comparison_object)
      super ||
        comparison_object.instance_of?(self.class) &&
        self.id && self.id == comparison_object.id
    end
    alias :eql? :==

  end
end
