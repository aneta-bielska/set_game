require 'minitest/autorun'
require 'minitest/reporters'
require 'pry'
Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(color: true)]

require_relative '../set_game/deck'
require_relative '../set_game/card'
require_relative '../set_game/set'
require_relative '../set_game/play_set'
require_relative '../set_game/info'
require_relative '../set_game'
