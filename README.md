Bounding Boxes
=====================
A gem to create geolocation bounding boxes from point radius geolocations

Installation
---------------------
`gem install 'bounding_boxes'`
or in a gem file:
`gem "bounding_boxes"`

Usage
--------------
The bounding boxes gem has three different types of bounding boxes. First, is the BaseBoundingBox.
This bounding box takes two latitude, longitude pairs and a units string (either km for kilometers or mi for miles).
`BB::BaseBoundingBox.new(47.6091, 122.3331, 48.6091, 123.3331, "km")`

There is a also a point bounding box which takes a latitude, logitude and a radius of a cirle around that point. 
It then creates a bounding box that contains that circle.
`BB::PointBoundingBox.new(47.6091, 122.1331, "20mi")`

The last type is probably not that useful except when splitting bounding boxes, it takes a latitude, longitude pair and
a side length. It then creates a square bounding box the southwest corner equal to that lat/long pair with side legths 
equal to the one provided.
`BB::SquareBoundingBox.new(47.6091, 122.3331, "10mi")`

There is also a countainer that create any of these boxes.
`BB::BoundingBox.new(latitude: 47.6091, longitude: 122.3331, radius: "20mi")` to create a PointBoundingBox
`BB::BoundingBox.new(latitude: 47.6091, longitude: 122.3331, side_length: "20mi")` to create SquareBoundingBox

The resulting box can then be split into an array of boxes with a max side length, useful for apis that have a max
geo bounding box. Currently Bounding Boxes can only split square bounding boxes and only in the unit specified during creation.
```
@box = BB::BoundingBox.new(latitude: 47.6091, longitude: 122.3331, radius: "10mi")
@box.split_geo(1)
```
This would return an array of Bounding Boxes that have a height and width of 1 mile and occupy the same area
as the original bounding box(a ten mile radius around the center of Seattle,WA).

Each bounding box also has the following methods:
max  -> returns a hash containing the latitude and longitude of the northeastern most corner of the bounding box
min  -> returns a hash containing the latitude and longitude of the southwestern most corner of the bounding box
max_lat -> returns the latitude of max
min_lat -> returns the latitude of min
max_long -> returns the longitude of max
min_long -> returns the longitude of min
height -> returns the height of the bounding box in the units specified during creation
width -> returns the width of the bounding box in the unites specified during creation
