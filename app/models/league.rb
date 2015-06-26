class League < ActiveRecord::Base
  
  has_many :teams
  has_many :players, :through => :teams

	validates :name, :abbreviation, :possible_numbers, {:presence => true}
  validates :name, :abbreviation, {:uniqueness => true}
  validates :abbreviation, :length => {minimum: 2, maximum: 10}

  def all_number_totals
  	all_numbers = {}
  	possible_numbers_array.each do |current_number|
  		all_numbers[current_number] = search_players_by_number(current_number)
  	end
    return all_numbers
  end

  def search_players_by_number(current_number)
  	number_players = []
  	self.players.each do |current_player|
  		if current_player.number == current_number
  			number_players << current_player
  		end
  	end
    return number_players
  end

  def possible_numbers_array
  	self.possible_numbers.split(',').map{|number|number.to_i}
  end

end
