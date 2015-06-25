class Player < ActiveRecord::Base
  
	belongs_to :team

	validates :team, :number, {:presence => true}
	validates :number, :length => {maximum: 2}

end
