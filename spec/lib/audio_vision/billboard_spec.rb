require 'spec_helper'

describe AudioVision::Billboard do
  describe '::api_path' do
    it "is the API path for the class" do
      AudioVision::Billboard.api_path.should eq "/api/v1/billboards"
    end
  end


  describe '::find' do
    it 'returns the object if it is found' do
      respond_with("billboard1_v1.json", uri: %r|api/v1/billboards|)

      billboard = AudioVision::Billboard.find(1)
      billboard.should be_a AudioVision::Billboard
      billboard.id.should eq 'billboard-1'
    end

    it 'is false if nothing is found' do
      respond_with(nil, {
        :uri      => %r|api/v1/billboards|,
        :body     => { error: "Not Found" },
        :status   => 404
      })

      AudioVision::Billboard.find(999).should eq false
    end
  end


  describe '::collection' do
    it "returns an array of objects" do
      respond_with("billboards_v1.json", uri: %r|api/v1/billboards|)

      billboards = AudioVision::Billboard.collection
      billboards.size.should eq 1
    end
  end


  describe '::current' do
    it 'finds the current billboard' do
      respond_with("billboard1_v1.json", uri: %r|api/v1/billboards/current|)

      billboard = AudioVision::Billboard.current
      billboard.should be_a AudioVision::Billboard
      billboard.id.should eq "billboard-1"
    end

    it "is nil if nothing found" do
      respond_with(nil, {
        :uri      => %r|api/v1/billboards/current|,
        :body     => { error: "Not Found" },
        :status   => 404
      })
 
      AudioVision::Billboard.current.should eq nil
    end
  end


  describe 'initialization' do
    it 'makes a new Billboard object' do
      t = Time.now

      billboard = AudioVision::Billboard.new({
        "id"              => "billboard-1",
        "published_at"    => t.to_s
      })

      billboard.id.should eq "billboard-1"
      billboard.published_at.to_s.should eq t.to_s
      billboard.posts.should eq Array.new
    end
  end
end
