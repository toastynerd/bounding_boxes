Dir[File.dirname(__FILE__) + "/bounding_boxes/*.rb"].each do |file| 
  require file
end
