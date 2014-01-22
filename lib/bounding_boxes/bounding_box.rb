module BB
  class BoundingBox
    attr_reader :max, :min

    def initialize(input)
      @input = input
      @input_radius = parse_radius
      @input_lat = parse_lat
      @input_long = parse_long
      @max = fetch_max
      @min = fetch_min
    end

    private
    def parse_radius
      parsed = @input.fetch(:radius).scan(/\d+|km|mi/)
      @units = parsed[1] || "mi"
      if @units == "km" then parsed[0].to_f else BB.miles_to_kilometers(parsed[0].to_f) end
    end

    def parse_lat
      BB.degrees_to_radians(@input.fetch(:latitude))
    end

    def parse_long
      BB.degrees_to_radians(@input.fetch(:longitude))
    end

    def fetch_max
      {latitude: BB.radians_to_degrees(@input_lat + delta_lat), 
       longitude: BB.radians_to_degrees(@input_long + delta_long)}
    end

    def fetch_min
      {latitude: BB.radians_to_degrees(@input_lat - delta_lat), 
       longitude: BB.radians_to_degrees(@input_long - delta_long)}
    end

    def delta_lat
      @input_radius / 6371
    end

    def delta_long
      Math.asin(Math.sin(delta_lat)/Math.cos(@input_lat))
    end
  end
end
