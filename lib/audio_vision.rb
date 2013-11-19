module AudioVision
  URL           = "http://audiovision.scpr.org"
  API_ROOT      = "/api"
  API_VERSION   = "v1"

  class << self
    # The API root path for all requests.
    def api_root
      @api_root ||= [API_ROOT, API_VERSION].join("/")
    end
  end
end

require 'audio_vision/version'
require 'audio_vision/client'
require 'audio_vision/attribution'
require 'audio_vision/category'
require 'audio_vision/asset'
require 'audio_vision/base'
require 'audio_vision/billboard'
require 'audio_vision/bucket'
require 'audio_vision/post'
