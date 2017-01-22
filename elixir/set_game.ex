defmodule Maths do
  def combination(0, _), do: [[]]
  def combination(_, []), do: []
  def combination(n, [h|t]) do
    (for y <- combination(n - 1, t), do: [h|y]) ++ combination(n, t)
  end
end

defmodule SetGame do
  defmodule Card do
    def new(c, s, t, n) do
      # todo: change string to sth else? List?
      "#{c}#{s}#{t}#{n}"
    end
  end

  defmodule Deck do
    def new() do
      for c <- 0..2, s <- 0..2, t <- 0..2, n <- 0..2,
      do: Card.new(c, s, t, n)
    end
  end

  defmodule Set do
    def valid?(c1, c2, c3) do
      c = for i <- 0..3 do
        (String.at(c1, i) == String.at(c2, i)) && (String.at(c3, i) == String.at(c2, i)) ||
        (String.at(c1, i) != String.at(c2, i)) && (String.at(c3, i) != String.at(c2, i)) && (String.at(c3, i) != String.at(c1, i))
      end

      c |> Enum.all?
    end
  end

  defmodule Cards do
    def any_sets?(cards) do
      _any_sets?({cards, length(cards) > 21})
    end

    defp _any_sets?({_cards, true}), do: true
    defp _any_sets?({cards, false}) do
      Enum.any?(Maths.combination(cards, 3), fn(set) -> apply(Set, :valid?, set) end)
    end
  end

  defmodule Play do
    def new_move({_deck, _table, false}), do: IO.puts "Game Over"
    def new_move({deck, table, true}) do
      for card <- table, do: IO.puts card
      picks = _user_picks(table)
      _validate_move({deck, table, picks, apply(Set, :valid?, picks)})
    end

    defp _user_picks(table) do
      for i <- 0..2, do: _validate_pick({i, table})
    end

    defp _validate_pick({i, table}) do
      pick = String.trim(IO.gets("Pick #{i}: "), "\n")
      if Enum.member?(table, pick) do
        pick
      else
        _validate_pick({i, table})
      end
    end

    defp _validate_move({deck, table, picks, true}) do
      IO.puts "valid"
      random_cards = Enum.take_random(deck, 3)
      updated_deck = deck -- random_cards
      updated_table = random_cards ++ (table -- picks)
      new_move({updated_deck, updated_table, Cards.any_sets?(updated_table ++ updated_deck)})
    end

    defp _validate_move({deck, table, picks, false}) do
      IO.puts "invalid"
      new_move({deck, table, true})
    end
  end

  def start() do
    deck = Deck.new()
    table = Enum.take_random(deck, 15)
    Play.new_move({deck -- table, table, true})
  end
end

SetGame.start()
