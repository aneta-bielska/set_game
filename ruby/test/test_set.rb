require_relative 'test_helper'

class SetTest < Minitest::Test
  def setup
    @card_1 = SetGame::Card.new(0,1,2,0,1)
    @card_2 = SetGame::Card.new(1,2,2,1,2)
    @card_3 = SetGame::Card.new(2,0,2,2,3)
    @card_4 = SetGame::Card.new(1,2,2,1,4)

    @valid_set   = SetGame::Set.new([@card_1, @card_2, @card_3])
    @invalid_set = SetGame::Set.new([@card_1, @card_2, @card_4])
  end

  def test_respond_to_valid
    assert_equal true, @valid_set.respond_to?(:valid?)
    assert_equal true, @invalid_set.respond_to?(:valid?)
  end

  def test_valid?
    assert_equal true, @valid_set.valid?
    assert_equal false, @invalid_set.valid?
  end
end
