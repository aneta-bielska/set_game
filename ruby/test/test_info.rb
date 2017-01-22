require_relative 'test_helper'

class InfoTest < Minitest::Test
  def setup
    card  = SetGame::Card.new(1,2,2,1,81)
    @info = SetGame::Info.new(card)
  end

  def test_respond_to_show
    assert_equal true, @info.respond_to?(:show)
  end

  def test_respond_to_valid_sets
    assert_equal true, @info.respond_to?(:valid_sets)
  end

  def test_respond_to_summary
    assert_equal true, @info.respond_to?(:summary)
  end

  def test_respond_to_hint
    assert_equal true, @info.respond_to?(:hint)
  end
end
