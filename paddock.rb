class Paddock

  attr_accessor :top_right, :sheepdogs, :x_boundary, :y_boundary

  def initialize()
    self.sheepdogs = []
  end

  def top_right=(value)
    boundaries = value.split(" ")
    self.x_boundary = boundaries[0].to_i
    self.y_boundary = boundaries[1].to_i
  end

  def within_boundary?(position)
    cooridinates = position.split(" ")
    cooridinates[0].to_i <= self.x_boundary && cooridinates[0].to_i >= 0 && cooridinates[1].to_i <= self.y_boundary && cooridinates[1].to_i >= 0
  end

  def position_vacant?(position, sheepdog)
    !sheepdogs.reject{ |d| d.object_id == sheepdog.object_id}.any? { |d| d.coordinates == position }
  end

  def add_sheepdog(sheepdog)
    sheepdog.paddock = self
    self.sheepdogs << sheepdog
  end

  def dogs_in_paddock
    self.sheepdogs
  end

end
