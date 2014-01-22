lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "bounding_boxes/version"

Gem::Specification.new do |spec| 
  spec.name = "bounding_boxes"
  spec.version = BB::VERSION
  spec.authors = ["Tyler Morgan"]
  spec.email = ["tylermorgan86@gmail.com"]
  spec.summary = "methods for covnersion between point radiuses and bounding boxes"
  spec.description = spec.summary
  spec.homepage = "https://github.com/tylermorgan86/bounding_boxes"
  spec.license = "MIT"

  spec.require_paths = ["lib"]
  spec.files = Dir["lib/**/*"]
end
