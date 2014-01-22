require_relative "../../spec_helper"

describe BB do
  describe "it should give the distance between two lat/long points" do
    before do 
      #the distance between Seattle and Portland is about
      #175 miles via car and 145 as the crow flies
      @point1 = {lat: 47.6097, long: 122.3331} #seattle
      @point2 = {lat: 45.5200, long: 122.6819} #portland
    end

    it "must get a decently close distance" do
      BB.distance_miles(@point1, @point2).must_be_within_delta 145, 5
    end

    it "must work also give kilometers" do
      BB.distance_kilometers(@point1, @point2).must_be_within_delta 233, 5
    end
  end
end
