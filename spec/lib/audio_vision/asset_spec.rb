require 'spec_helper'

describe AudioVision::Asset do
  it 'is a representation of the Asset JSON' do
    asset = AudioVision::Asset.new({
      "title" => "02 - DCFS Night Shift",
      "caption" => "Social worker Gesenia Macias leaves an apartment with two police officers after unsuccessfully trying to find the parents in a reported neglect case. ",
      "owner" => "Grant Slater/KPCC",
      "thumbnail" => {
        "url" => "http://a.scpr.org/i/2ee96431ba36e1985a12c3212db6ee20/71930-lsquare.jpg",
        "width" => 188,
        "height" => 188
      },
      "small" => {
        "url" => "http://a.scpr.org/i/2ee96431ba36e1985a12c3212db6ee20/71930-small.jpg",
        "width" => 450,
        "height" => 300
      },
      "large" => {
        "url" => "http://a.scpr.org/i/2ee96431ba36e1985a12c3212db6ee20/71930-eight.jpg",
        "width" => 729,
        "height" => 486
      },
      "full" => {
        "url" => "http://a.scpr.org/i/2ee96431ba36e1985a12c3212db6ee20/71930-full.jpg",
        "width" => 1024,
        "height" => 682
      }
    })

    asset.caption.should eq "Social worker Gesenia Macias leaves an apartment with two police officers after unsuccessfully trying to find the parents in a reported neglect case. "
    asset.owner.should eq "Grant Slater/KPCC"
    asset.title.should eq "02 - DCFS Night Shift"

    asset.thumbnail.should be_a AudioVision::Asset::Size
    asset.small.should be_a AudioVision::Asset::Size
    asset.large.should be_a AudioVision::Asset::Size
    asset.full.should be_a AudioVision::Asset::Size
  end


  describe AudioVision::Asset::Size do
    it "is a representation of the asset size JSON" do
      size = AudioVision::Asset::Size.new({
        "url" => "http://a.scpr.org/i/2ee96431ba36e1985a12c3212db6ee20/71930-full.jpg",
        "width" => 1024,
        "height" => 682
      })

      size.width.should eq 1024
      size.height.should eq 682
      size.url.should eq "http://a.scpr.org/i/2ee96431ba36e1985a12c3212db6ee20/71930-full.jpg"
    end
  end
end
