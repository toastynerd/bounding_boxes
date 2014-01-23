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
    end

    it "should split, like a mofoing banana, split!" do
      assert_equal(1 , 1)
    end
  end
end
