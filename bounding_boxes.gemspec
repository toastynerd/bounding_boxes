lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "bounding_boxes/version"

Gem::Specification.new do |spec|
  spec.name = "bounding_boxes"
  spec.version = BB::VERSION
  spec.authors = ["Tyler Morgan", "Rob Trame"]
  spec.email = ["tylermorgan86@gmail.com", "rtrame@joinhandshake.com"]
  spec.summary = "geolocation bounding boxes"
  spec.description = "a gem to convert point_radius geolocations to bounding boxes and split them into smaller boxes"
  spec.homepage = "https://github.com/tylermorgan86/bounding_boxes"
  spec.license = "MIT"

  spec.require_paths = ["lib"]
  spec.files = Dir["lib/**/*"]
end
