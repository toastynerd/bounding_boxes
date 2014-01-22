require_relative "../../spec_helper"

describe BB do
  describe "it should return a bounding box from lat/long/radius" do
    before do
      @location_miles = {latitude: 47.6097, longitude: 122.3331, radius: "20mi"}
      @location_km = {latitude: 47.6097, longitude: 122.3331, radius: "20km"}
      @start_point = {latitude: 47.6097, longitude: 122.3331 }
    end

    it "bounding box should contain the original point radius" do
      result = BB::BoundingBox.new(@location_miles)
      BB.distance_miles({latitude: result.max[:latitude], 
                         longitude: @start_point[:longitude]},
                        @start_point).must_be_within_delta 20, 1
      BB.distance_miles({latitude: @start_point[:latitude],
                         longitude: result.max[:longitude]},
                         @start_point).must_be_within_delta 20, 1
    end

    it "should work for kilometers as well" do
      result = BB::BoundingBox.new(@location_km)
      BB.distance_kilometers({latitude: result.max[:latitude], 
                         longitude: @start_point[:longitude]},
                        @start_point).must_be_within_delta 20, 1
      BB.distance_kilometers({latitude: @start_point[:latitude],
                              longitude: result.max[:longitude]},
                              @start_point).must_be_within_delta 20, 1
    end
  end
end
