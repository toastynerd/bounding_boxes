module BB
  def self.distance_kilometers(point1, point2)
    lat1 = BB::degrees_to_radians(point1.fetch(:latitude))
    long1 = BB::degrees_to_radians(point1.fetch(:longitude))
    lat2 = BB::degrees_to_radians(point2.fetch(:latitude))
    long2 = BB::degrees_to_radians(point2.fetch(:longitude))

    (Math.acos(Math.sin(lat1) * Math.sin(lat2) + Math.cos(lat1) * Math.cos(lat2) * Math.cos(long1 - long2)) * 6371)
  end

  def self.distance_miles(point1, point2)
    BB.kilometers_to_miles(BB.distance_kilometers(point1, point2))
  end

  def self.degrees_to_radians(number)
    number * Math::PI / 180
  end

  def self.radians_to_degrees(number)
    number * 180 / Math::PI
  end

  def self.kilometers_to_miles(number)
    number * 0.621371
  end

  def self.miles_to_kilometers(number)
    number * 1.60934
  end
end
