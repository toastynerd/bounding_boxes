module BB
  #can create any type of bounding box and
  #will be able to split it into an array of bounding boxes
  class BoundingBox < BaseBoundingBox
    attr_accessor :box
    def initialize(options = {})
      if options.has_key?(:radius)
        build_point_bounding_box(options)
      elsif options.has_key?(:side_length)
        build_square_bounding_box(options)
      elsif options.size == 5 && options.key_present?(:units)
        build_base_bounding_box(options)
      end
    end

    def split_geo(max_size)
      raise "split size greater than width or height" unless self.width > max_size && self.height > max_size
      rows = (self.height / max_size).to_i
      columns = (self.width / max_size).to_i

      split_width = self.width / columns
      split_height = self.height / rows

      temp_array = []
      temp_lat = self.min_lat
      temp_long = self.min_long

      (rows - 1).times do |row_num| 
        (columns - 1).times do |column_num| 
          temp_array << BB::SquareBoundingBox.new(temp_lat,
                                                  temp_long,
                                                  "#{max_size}#{self.preferred_units}" )
          temp_long = temp_array.last.max_long
        end
        temp_lat = temp_array.last.max_lat
        temp_long = self.min_long
      end
      temp_array
    end

    private
    def set_max_min
      @max = @box.max
      @min = @box.min
      @preferred_units = @box.preferred_units
    end

    def build_point_bounding_box(options)
      @box = BB::PointBoundingBox.new(options.fetch(:latitude), 
                                     options.fetch(:longitude), 
                                     options.fetch(:radius))
      set_max_min
    end

    def build_square_bounding_box(options)
      @box = BB::SquareBoundingBox.new(options.fetch(:latitude),
                                       options.fetch(:longitude),
                                       options.fetch(:side_length))
      set_max_min
    end

    def build_base_bounding_box(options)
      @box = BB::BaseBoundingBox.new(options.fetch(:lat1),
                                     options.fetch(:long1),
                                     options.fetch(:lat2),
                                     options.fetch(:long2),
                                     options.fetch(:units))
      set_max_min
    end


  end
end
