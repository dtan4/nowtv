require "spec_helper"

module Nowtv
  describe Region do
    describe "#get_region_id" do
      context "with valid prefecture name" do
        it "should return region id" do
          expect(Nowtv::Region.get_region_id("tokyo")).to eq 13
        end
      end

      context "with valid capitalized prefecture name" do
        it "should return region id" do
          expect(Nowtv::Region.get_region_id("TOKYO")).to eq 13
        end
      end

      context "with invalid prefecture name" do
        it "should return 0" do
          expect(Nowtv::Region.get_region_id("nippon")).to eq 0
        end
      end
    end
  end
end
