require_relative 'test_helper'

class DeckTest < Minitest::Test
  def setup
    @deck = SetGame::Deck.new.create
  end

  def test_respond_to_create
    assert_equal true, SetGame::Deck.new.respond_to?(:create)
  end

  def test_created_deck_is_array
    assert_equal Array, @deck.class
  end

  def test_created_deck_has_81_cards
    assert_equal 81, @deck.size
  end

  def test_deck_has_1080_valid_sets
    valid_sets_count = @deck.combination(3).select do |set|
      SetGame::Set.new(set).valid?
    end

    assert_equal 1080, valid_sets_count.size
  end

  def test_all_deck_cards_are_different
    cards = @deck.map { |c| [c.texture, c.number, c.shape, c.color] }

    assert_equal true, cards.combination(2).all? { |x,y| x != y }
  end
end
