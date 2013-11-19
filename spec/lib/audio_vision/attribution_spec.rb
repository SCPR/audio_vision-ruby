require 'spec_helper'

describe AudioVision::Attribution do
  it "is a representation of the Attribution JSON object" do
    attribution = AudioVision::Attribution.new(
      {
        "name" => "Grant Slater",
        "url" => "http://audiovision.scpr.org/about/grant-slater",
        "role_text" => "Author",
        "role" => 1
      }
    )

    attribution.name.should eq "Grant Slater"
    attribution.url.should eq "http://audiovision.scpr.org/about/grant-slater"
    attribution.role_text.should eq "Author"
    attribution.role.should eq 1
  end
end
