class Sheepdog

  attr_accessor :paddock, :position, :direction, :x, :y, :proposed_x, :proposed_y

  def starting_position=(value)
    input = value.split(" ")
    self.x = input[0].to_i
    self.y = input[1].to_i
    self.direction = input[2]
  end

  def command=(value)
    result = ""
    value.each_char do |v|
      if %w(L R).include?(v)
        turn(v)
      else
        result = move
      end
      break if ["Sheepdog can't leave the paddock", "Sheepdog can't run through another sheepdog"].include?(result)
    end
    puts result
  end

  def coordinates
    "#{x} #{y}"
  end

  def position
    "#{coordinates} #{direction}"
  end

  def move
    if paddock.within_boundary?(proposed_move) && paddock.position_vacant?(proposed_move, self)
      self.x, self.y = proposed_x, proposed_y
      position
    else
      report_error
    end
  end

  def proposed_move
    self.proposed_x, self.proposed_y = x, y
    case direction
    when "N" then self.proposed_y += 1
    when "E" then self.proposed_x += 1
    when "S" then self.proposed_y -= 1
    when "W" then self.proposed_x -= 1
    end
    "#{proposed_x} #{proposed_y}"
  end

  def turn(value)
    if value == "L"
      turn_left
    elsif value == "R"
      turn_right
    end
  end

  def turn_left
    self.direction = case direction
    when "N" then "W"
    when "E" then "N"
    when "S" then "E"
    when "W" then "S"
    end
  end

  def turn_right
    case direction
    when "N" then self.direction = "E"
    when "E" then self.direction = "S"
    when "S" then self.direction = "S"
    when "W" then self.direction = "N"
    end
  end
end

def report_error
  !paddock.within_boundary?(proposed_move) ? "Sheepdog can't leave the paddock" : "Sheepdog can't run through another sheepdog"
end
