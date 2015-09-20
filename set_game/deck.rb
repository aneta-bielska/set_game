module SetGame
  class Deck
    def create
      deck = []
      id = 0

      (0..2).to_a.each do |color|
        (0..2).to_a.each do |shape|
          (0..2).to_a.each do |texture|
            (0..2).to_a.each do |number|
              id += 1
              deck << Card.new(color, texture, number, shape, id)
            end
          end
        end
      end

      deck
    end
  end
end
