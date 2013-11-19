require 'spec_helper'

describe AudioVision do
  describe '::api_root' do
    it 'is the API root' do
      AudioVision.api_root.should eq "/api/v1"
    end
  end
end
