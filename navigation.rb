$LOAD_PATH.unshift(File.dirname(__FILE__))
require "paddock"
require "sheepdog"

paddock = Paddock.new
paddock.top_right = "5 5"

first_dog = Sheepdog.new
paddock.add_sheepdog(first_dog)

first_dog.starting_position = "0 0 N"
first_dog.command = "MMRMM"

next_dog = Sheepdog.new
paddock.add_sheepdog(next_dog)

next_dog.starting_position = "0 0 N"
next_dog.command = "MMRMM"

last_dog = Sheepdog.new
paddock.add_sheepdog(last_dog)

last_dog.starting_position = "0 0 S"
last_dog.command = "MMRMM"
