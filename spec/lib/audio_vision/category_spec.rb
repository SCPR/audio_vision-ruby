require 'spec_helper'

describe AudioVision::Category do
  it "is a representation of the Category JSON object" do
    category = AudioVision::Category.new(
      {
        "id" => 2,
        "title" => "Images",
        "slug" => "images",
        "description" => "The heartbeat of AudioVision. The best from our team of photojournalists — and discover images from the photographers who inspire them.",
        "public_url" => "http://audiovision.scpr.org/images",
        "permalink" => "http://audiovision.scpr.org/images"
      }
    )

    category.id.should eq 2
    category.title.should eq "Images"
    category.slug.should eq "images"
    category.description.should eq "The heartbeat of AudioVision. The best from our team of photojournalists — and discover images from the photographers who inspire them."
    category.public_url.should eq "http://audiovision.scpr.org/images"
  end
end
