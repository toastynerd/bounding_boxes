require_relative "../../spec_helper"

describe BB::BaseBoundingBox do
  describe "creation" do
    it "should be creatable" do
      assert_silent{ BB::BaseBoundingBox.new(47.6097, 122.3331, 48.6097, 122.3331, "mi") }
    end
  end

  describe "no change in latitude" do
    before do
      #this isn't a perfect square like a generated bb would be
      @box = BB::BaseBoundingBox.new(47.6097, 122.3331, 47.6097, 123.3331, "mi")
    end

    it "should be able to give width in miles" do
      @box.width.must_be_within_delta 45, 10
      @box.width_mi.must_be_within_delta 45, 10
      @box.width_mil.must_be_within_delta 45, 10
      @box.width_miles.must_be_within_delta 45, 10
    end

    it "should be able to give side width in km" do
      @box.width(:kilometers).must_be_within_delta (45 * 1.6), 10
      @box.width_km.must_be_within_delta (45 * 1.6), 10
      @box.width_kilometers.must_be_within_delta (45 * 1.6), 10
    end

    it "height in miles" do
      @box.height.must_equal 0
      @box.height_mi.must_equal 0
      @box.height_mil.must_equal 0
      @box.height_miles.must_equal 0
    end

    it "height in km" do
      @box.height(:kilometers).must_equal 0
      @box.height_km.must_equal 0
      @box.height_kilometers.must_equal 0
    end
  end

  describe "no change in longitude" do
    before do 
      @box = BB::BaseBoundingBox.new(47.6097, 122.3331, 48.6097, 122.3331, "mi") 
    end

    it "should be able to give width in miles" do
      @box.width.must_equal 0
      @box.width_mi.must_equal 0
      @box.width_mil.must_equal 0
      @box.width_miles.must_equal 0
    end

    it "should be able to give width in km" do
      @box.width(:kilometers).must_equal 0
      @box.width_km.must_equal 0
      @box.width_kilometers.must_equal 0
    end

    it "height in miles" do
      @box.height.must_be_within_delta 70, 5
      @box.height_mi.must_be_within_delta 70, 5
      @box.height_mil.must_be_within_delta 70, 5
      @box.height_miles.must_be_within_delta 70, 5
    end

    it "height in km" do
      @box.height(:kilometers).must_be_within_delta (70 * 1.6), 5
      @box.height_km.must_be_within_delta (70 * 1.6), 5
      @box.height_kilometers.must_be_within_delta (70 *1.6), 5
    end
  end
end
