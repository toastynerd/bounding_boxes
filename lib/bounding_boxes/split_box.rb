module BB
  def self.split_box(box, length_of_side)
    parsed = length_of_side.to_s.scan(/\d+|km|mi/)
    split_length = parsed[0].to_f
    units = parsed[1]
    raise "box width smaller than split" unless box.send("side_length_#{units}".to_sym) > split_length


  end
end
