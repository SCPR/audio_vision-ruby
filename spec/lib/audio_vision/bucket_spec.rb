require 'spec_helper'

describe AudioVision::Bucket do
  describe '::api_path' do
    it "is the API path for the class" do
      AudioVision::Bucket.api_path.should eq "/api/v1/buckets"
    end
  end


  describe '::find' do
    it 'returns the object if it is found' do
      respond_with("bucket_v1.json", uri: %r|api/v1/buckets|)

      bucket = AudioVision::Bucket.find("featured-posts")
      bucket.should be_a AudioVision::Bucket
      bucket.id.should eq 'featured-posts'
    end

    it 'is false if nothing is found' do
      respond_with(nil, {
        :uri      => %r|api/v1/buckets|,
        :body     => { error: "Not Found" },
        :status   => 404
      })

      AudioVision::Bucket.find(999).should eq false
    end
  end


  describe '::collection' do
    it "returns an array of objects" do
      respond_with("buckets_v1.json", uri: %r|api/v1/buckets|)

      buckets = AudioVision::Bucket.collection
      buckets.size.should eq 4
    end
  end


  describe '::find_by_key' do
    it 'finds the bucket if available' do
      respond_with("bucket_v1.json", uri: %r|api/v1/buckets|)

      bucket = AudioVision::Bucket.find_by_key('featured-posts')
      bucket.should be_a AudioVision::Bucket
      bucket.id.should eq "featured-posts"
    end

    it "is false if nothing found" do
      respond_with(nil, {
        :uri      => %r|api/v1/buckets|,
        :body     => { error: "Not Found" },
        :status   => 404
      })
      
      AudioVision::Bucket.find_by_key("lolnope").should eq false
    end
  end


  describe 'initialization' do
    it 'makes a new Bucket object' do
      bucket = AudioVision::Bucket.new({
        "id"            => "featured-posts",
        "updated_at"    => Time.now.to_s
      })

      bucket.id.should eq "featured-posts"
      bucket.posts.should eq Array.new
    end
  end
end
