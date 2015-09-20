require './set_game/play_set.rb'
require './set_game/deck'
require './set_game/card'
require './set_game/set'
require './set_game/info'

puts "----------- set game -----------"
play_set = SetGame::PlaySet.new
play_set.play
