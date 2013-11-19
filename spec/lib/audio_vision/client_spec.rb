require 'spec_helper'

describe AudioVision::Client do
  describe '#get' do
    it 'fires a GET request to the API' do
      respond_with("post_v1.json", uri: "http://audiovision.scpr.org/api/v1/posts/1")
      client = AudioVision::Client.new

      response = client.get("posts/1")
      response.should be_a Faraday::Response
      response.body["id"].should eq "post-104"
    end
  end
end
