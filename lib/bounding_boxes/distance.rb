module BB
  def self.distance_kilometers(point1, point2)
    lat1 = BB::degrees_to_radians(point1.fetch(:lat))
    long1 = BB::degrees_to_radians(point1.fetch(:long))
    lat2 = BB::degrees_to_radians(point2.fetch(:lat))
    long2 = BB::degrees_to_radians(point2.fetch(:long))

    (Math.acos(Math.sin(lat1) * Math.sin(lat2) + Math.cos(lat1) * Math.cos(lat2) * Math.cos(long1 - long2)) * 6371)
  end

  def self.distance_miles(point1, point2)
    BB.distance_kilometers(point1, point2) * 0.621371
  end

  def self.degrees_to_radians(number)
    number * Math::PI / 180
  end
end
