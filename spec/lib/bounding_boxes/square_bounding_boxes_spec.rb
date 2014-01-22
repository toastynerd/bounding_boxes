require_relative "../../spec_helper"

describe BB::SquareBoundingBox do
  describe "creation" do
    it "should be creatable" do
      assert_silent{ BB::SquareBoundingBox.new(47.6097, 122.3331, "20mi") }
    end
  end

  describe "a valid box" do
    before do
      @box = BB::SquareBoundingBox.new(47.6097, 122.3331, "20mi")
    end

    it "should have height of 20mi" do
      @box.height.must_be_within_delta 20, 1
    end

    it "should have width of 20mi" do
      @box.width.must_be_within_delta 20, 1
    end

    it "should have min lat of 47.6097" do
      @box.min_lat.must_be_within_delta 47.6097, 0.1
    end

    it "should have min long of 122.3331" do
      @box.min_long.must_be_within_delta 122.3331, 0.1
    end
  end
end
