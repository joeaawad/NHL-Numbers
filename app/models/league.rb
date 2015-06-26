class League < ActiveRecord::Base
  
  has_many :teams
  has_many :players, :through => :teams
  
	validates :name, :abbreviation, :possible_numbers, {:presence => true}
  validates :name, :abbreviation, {:uniqueness => true}
  validates :abbreviation, :length => {minimum: 2, maximum: 10}

  def all_number_totals
  	numbers = {}

  end
end
