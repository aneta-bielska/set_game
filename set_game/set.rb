module SetGame
  class Set
    def initialize(set)
      @set = set
    end

    def valid?
      Card::FEATURES.all? { |feature| valid_feature?(feature) }
    end

    def set_out_status
      @set.each { |card| card.status = 'out' }
    end

    private

    def same?(feature)
      sets(feature).all? { |card_1, card_2| card_1 == card_2 }
    end

    def different?(feature)
      sets(feature).all? { |card_1, card_2| card_1 != card_2 }
    end

    def sets(feature)
      @set.map(&feature).combination(2).to_a
    end

    def valid_feature?(feature)
      same?(feature) || different?(feature)
    end
  end
end
