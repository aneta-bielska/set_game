module SetGame
  class Card
    FEATURES = %i[color shape texture number]

    attr_accessor :color, :shape, :texture, :number, :id, :status

    def initialize(color, shape, texture, number, id)
      @status  = 'deck'
      @color   = color
      @shape   = shape
      @texture = texture
      @number  = number
      @id      = id
    end
  end
end
