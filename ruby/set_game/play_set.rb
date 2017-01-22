module SetGame
  class PlaySet
    def initialize
      @deck = Deck.new.create
      @start_time = Time.now
    end

    def play
      @deck.sample(12).each { |card| card.status = 'table' }
      puts "Type your name:"
      @name = gets.chomp
      @name = 'guest' if @name.empty?
      puts "\nHello, #{@name}!"
      game_pack
      while sets_are_available?
        @set.valid? ? valid_set : invalid_set
      end
    end

    private

    def valid_set
      puts "\nValid set"
      @set.set_out_status
      add_3_cards if find_cards('table').size < 12
      game_pack
    end

    def invalid_set
      puts "\nInvalid set"
      game_pack
    end

    def game_pack
      info = Info.new(@deck)
      return puts info.summary(@start_time, @name) unless sets_are_available?
      while info.valid_sets.size == 0 && find_cards('deck').any?
        add_3_cards
      end
      info.show
      puts "Need hint? (y/n)"
      info.hint if gets.chomp == 'y'
      picking
    end

    def sets_are_available?
      cards = find_cards('table') + find_cards('deck')
      if cards.size < 21
        cards.combination(3).to_a.any? do |set|
          Set.new(set).valid?
        end
      end

      true
    end

    def add_3_cards
      find_cards('deck').sample(3).each { |card| card.status = 'table' }
    end

    def picking
      set = (1..3).to_a.map { |pick| validate_pick(pick) }
      @set = Set.new(set)
    end

    def validate_pick(num)
      table_cards = find_cards('table')
      puts "Pick #{num}:"
      pick = gets.to_i
      pick = table_cards.detect { |card| card.id == pick.to_i }
      table_cards.include?(pick) ? pick : validate_pick(num)
    end

    def find_cards(status)
      @deck.select { |card| card.status == status }
    end
  end
end
