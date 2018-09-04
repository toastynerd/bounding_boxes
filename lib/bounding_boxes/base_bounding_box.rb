module BB
  class BaseBoundingBox
    attr_accessor :max, :min, :preferred_units

    def initialize(lat1, long1, lat2, long2, units)
      @min = {latitude: lat1, longitude: long1}
      @max = {latitude: lat2, longitude: long2}
      @preferred_units = units
    end

    def side_length
      self.send("side_length_#{preferred_units}".to_sym)
    end

    def width(units = @preferred_units)
      BB.send("distance_#{units}".to_sym, {latitude: @max[:latitude],
                         longitude: @max[:longitude]},
                        {latitude: @max[:latitude],
                         longitude: @min[:longitude]})
    end

    def height(units = @preferred_units)
      BB.send("distance_#{units}".to_sym, {latitude: @max[:latitude],
                                           longitude: @max[:longitude]},
                                           {latitude: @min[:latitude],
                                           longitude: @max[:longitude]})
    end

    def min_lat
      @min[:latitude]
    end

    def min_long
      @min[:longitude]
    end

    def max_lat
      @max[:latitude]
    end

    def max_long
      @max[:longitude]
    end

    def fetch(property)
      raise KeyError unless self.respond_to?(property)
      self.send(property)
    end

    def method_missing(name, *args)
      attribute = name.to_s
      if attribute =~ /(width_)(km|kilometers)/
        width(:kilometers)
      elsif attribute =~ /(width_)(mi|mil|miles)/
        width(:miles)
      elsif attribute =~ /(height_)(km|kilometers)/
        height(:kilometers)
      elsif attribute =~ /(height_)(mi|mil|miles)/
        height(:miles)
      elsif attribute =~ /(min|minimum)_(lat|latitude)/
        min_lat
      elsif attribute =~ /(min|minimum)_(lon|long|longitude)/
        min_long
      elsif attribute =~ /(max|maximum)_(lat|latitude)/
        max_lat
      elsif attribute =~ /(max|maximum)_(lon|long|longitude)/
        max_long
      end
    end
  end
end
