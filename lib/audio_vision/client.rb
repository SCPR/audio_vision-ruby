require 'faraday'
require 'faraday_middleware'

module AudioVision
  class Client
    # Get a response from the AudioVision API.
    # Returns a Faraday Response object.
    #
    # Example:
    #   client.get("posts/1")
    def get(path, params={})
      connection.get do |request|
        request.url path
        request.params = params
      end
    end


    private

    def connection
      @connection ||= begin
        Faraday.new(:url => api_root) do |conn|
          conn.response :json
          conn.adapter Faraday.default_adapter
        end
      end
    end

    def api_root
      @api_root ||= AudioVision::URL + AudioVision.api_root
    end
  end
end
