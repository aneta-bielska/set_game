require_relative 'test_helper'

class PlaySetTest < Minitest::Test
  def setup
    @play_set = SetGame::PlaySet.new
  end

  def test_respond_to_play
    assert_equal true, @play_set.respond_to?(:play)
  end
end
