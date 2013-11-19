require 'spec_helper'

describe AudioVision::Post do
  describe '::api_path' do
    it "is the API path for the class" do
      AudioVision::Post.api_path.should eq "/api/v1/posts"
    end
  end


  describe '::find' do
    it 'returns the object if it is found' do
      respond_with("post_v1.json", uri: %r|api/v1/posts|)

      post = AudioVision::Post.find(104)
      post.should be_a AudioVision::Post
      post.id.should eq 'post-104'
    end

    it 'is false if nothing is found' do
      respond_with(nil, {
        :uri      => %r|api/v1/posts|,
        :body     => { error: "Not Found" },
        :status   => 404
      })

      AudioVision::Post.find(999).should eq false
    end
  end


  describe '::collection' do
    it "returns an array of objects" do
      respond_with("posts_v1.json", uri: %r|api/v1/posts|)

      posts = AudioVision::Post.collection
      posts.size.should eq 2
    end

    it "accepts options" do
      respond_with("posts_images_v1.json", uri: %r|api/v1/posts\?category=images|)
      posts = AudioVision::Post.collection(category: "images")
      posts.first.id.should eq "post-321"
    end
  end


  describe '::find_by_url' do
    it "finds the post" do
      respond_with("post_v1.json", uri: %r|api/v1/posts|)

      post = AudioVision::Post.find_by_url("http://audiovision.scpr.org/posts/104")
      post.should be_a AudioVision::Post
      post.id.should eq "post-104"
    end

    it "returns nil if no post is found" do
      respond_with(nil, {
        :uri      => %r|api/v1/posts|,
        :body     => { error: "Not Found" },
        :status   => 404
      })

      post = AudioVision::Post.find_by_url("http://audiovision.scpr.org/posts/104")
      post.should eq nil
    end
  end


  describe "initialization" do
    it 'is a Post' do
      post = AudioVision::Post.new({
        "id"              => "post-104",
        "published_at"    => Time.now.to_s
      })

      post.id.should eq "post-104"
      post.assets.should eq Array.new
      post.attributions.should be_a Array
    end
  end
end
