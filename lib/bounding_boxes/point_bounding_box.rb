module BB
  # creates a bounding box that contains a circle
  # with center of latitude, longitude and radius of radius
  class PointBoundingBox < BaseBoundingBox
    attr_reader :latitude, :longitude, :radius

    def initialize(latitude, longitude, radius)
      @radius    = parse_radius(radius)
      @latitude  = BB.degrees_to_radians(latitude)
      @longitude = BB.degrees_to_radians(longitude)

      d_lat = delta_latitude
      d_lon = delta_longitude

      super(
        BB.radians_to_degrees(@latitude - d_lat),
        BB.radians_to_degrees(@longitude - d_lon),
        BB.radians_to_degrees(@latitude + d_lat),
        BB.radians_to_degrees(@longitude + d_lon),
        @radius_units
      )
    end

    private

    def parse_radius(radius)
      parsed = radius.scan(/^(\d+(\.\d+)?)(km|mi)?$/).flatten
      @radius_units = %w[km mi].include?(parsed.last) ? parsed.last : 'mi'

      if @radius_units == 'km'
        parsed.first.to_f
      else
        BB.miles_to_kilometers(parsed.first.to_f)
      end
    end

    def delta_latitude
      BB.kilometers_to_radians(@radius)
    end

    def delta_longitude
      radius_radians = BB.kilometers_to_radians(@radius)
      2 * Math.asin(Math.sin(radius_radians / 2) / Math.cos(@latitude))
    end
  end
end
