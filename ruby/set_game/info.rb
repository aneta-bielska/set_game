require 'json'

module SetGame
  class Info
    def initialize(deck)
      @deck = deck
    end

    def show
      table_cards = find_cards('table')

      puts "+----+-------+-------+--------+---------+"
      puts "| id | color | shape | number | texture |"
      puts "+----+-------+-------+--------+---------+"
      table_cards.each { |card| info(card) }
      puts "+----+-------+-------+--------+---------+"
      puts "In deck: #{find_cards('deck').count}"
      puts "On table: #{find_cards('table').count}"
      puts "Out: #{find_cards('out').count}"
      puts "Available sets: #{valid_sets.size}"
    end

    def valid_sets
      find_cards('table').combination(3).to_a.keep_if do |set|
        Set.new(set).valid?
      end
    end

    def summary(name, time)
      puts "---------- Game over ----------"
      puts "Time: #{time(time)}"
      puts "Best scores:"
      update_scores(name, time).each do |score|
        puts score
      end
    end

    def hint
      return if valid_sets.empty?

      valid_sets.map do |card_1, card_2, card_3|
        puts "Valid set: #{card_1.id}, #{card_2.id}, #{card_3.id}"
        return
      end
    end

    private

    def time(start_time)
      time = Time.now - start_time
      Time.at(time.to_i.abs).utc.strftime "%H:%M:%S"
    end

    def info(card)
      id = sprintf('%02d', card.id.to_s)
      color = card.color.to_s
      shape = card.shape.to_s
      number = card.number.to_s
      texture = card.texture.to_s

      puts "| "+id +" |   "+color+"   |   "+shape+"   |    "+number+"   |    "+texture+"    |"
    end

    def find_cards(status)
      @deck.select { |card| card.status == status }
    end

    def update_scores(name, time)
      file_path = './scores.txt'
      old_scores = JSON.load(File.read(file_path)).to_a
      updated_scores = (old_scores << "#{time(time)} (#{name})").sort.take(5)
      File.write(file_path, updated_scores)

      updated_scores
    end
  end
end
