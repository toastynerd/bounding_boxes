module BB
  #creates a square bounding box sides equal to side_length
  #and southwest corner equal to lat/long
  class SquareBoundingBox < BaseBoundingBox
    def initialize(lat, long, side_length)
      @side_length = parse_side_length(side_length)
      @lat = lat
      @long = long
      @min = fetch_min
      @max = fetch_max
    end

    private
    def parse_side_length(side_length)
      parsed = side_length.scan(/\d+|mi|km/)
      @preferred_units = parsed[1] || "mi"
      parsed[0].to_f
    end

    def fetch_min
      {latitude: @lat, longitude: @long}
    end

    def fetch_max
      BB::PointBoundingBox.new(@lat, @long, "#{@side_length}#{@preferred_units}").max
    end
  end
end
