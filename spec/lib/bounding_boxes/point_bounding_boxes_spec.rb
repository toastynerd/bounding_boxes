require_relative "../../spec_helper"

describe BB::PointBoundingBox do
  describe "creation" do
    it "should be creatable" do
      assert_silent{ BB::PointBoundingBox.new(47.6097, 122.3331, "20mi") }
    end
  end


  describe "valid box" do
    before do
      @box = BB::PointBoundingBox.new(47.6097, 122.3331, "20mi")
    end

    it "should have the right height" do
      @box.height.must_be_within_delta 40, 2
    end

    it "should have the right width" do
      @box.width.must_be_within_delta 40, 2
    end
  end
end
