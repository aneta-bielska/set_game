require_relative 'test_helper'

class CardTest < Minitest::Test
  def test_initialize_card
    card = SetGame::Card.new(1,2,2,1,81)

    assert_equal 'deck', card.status
    assert_equal Fixnum, card.color.class
    assert_equal Fixnum, card.number.class
    assert_equal Fixnum, card.shape.class
    assert_equal Fixnum, card.texture.class
    assert_equal Fixnum, card.id.class
  end
end
