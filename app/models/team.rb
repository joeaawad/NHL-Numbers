class Team < ActiveRecord::Base
  
	belongs_to :league
	has_many :players

	validates :league, :location, :nickname, :abbreviation, {:presence => true}
	validates :nickname, :abbreviation, {:uniqueness => true}
	validates :abbreviation, :length => {minimum: 2, maximum: 3}

	def full_name
		"#{self.location} #{self.nickname}"
	end

end
