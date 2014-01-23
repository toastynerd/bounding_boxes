require_relative "../../spec_helper"

describe BB::BoundingBox do
  describe "creation" do
    it "should say 'can I cook or what?' but it doesn't, it just gets created" do
      assert_silent{ BB::BoundingBox.new( latitude: 47.6097, longitude: 122.3331, radius: "20mi") }
    end
  end

  describe "a point bounding box" do
    before do
      @box = BB::BoundingBox.new( latitude: 47.6097, longitude: 122.3331, radius: "20mi" )
    end

    it "should point create a bounding box" do
      @box.width.must_be_within_delta 40, 2
      @box.height.must_be_within_delta 40, 2
    end
  end

  describe "a square bounding box" do
    before do
      @box = BB::BoundingBox.new( latitude: 47.6097, longitude: 122.3331, side_length: "20mi")
    end

    it "should give you super powers but it doesn't, so here's a bounding box instead" do
      @box.width.must_be_within_delta 20, 2
    end
  end

  describe "let's split it up" do
    before do
      @box = BB::BoundingBox.new( latitude: 47.6097, longitude: 122.3331, radius: "20mi" )
      @result = @box.split_geo(10)
    end

    it "should have the correct number of boxes" do
      @result.size.must_equal 4
    end
      

    it "should split, like a mofoing banana, split!" do
      not_bigger = catch(:outside) do
        @result.each do |box| 
          if box.max_lat > @box.max_lat || box.max_long > @box.max_long || box.min_lat < @box.min_lat || box.min_long < @box.min_long
            p "original, max: #{@box.max.inspect} min: #{@box.min.inspect}"
            p "broke: max: #{box.max.inspect} min: #{box.min.inspect}"
            throw :outside, true
          end
        end
        false
      end
      not_bigger.must_equal false
    end
  end
end
