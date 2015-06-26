class Player < ActiveRecord::Base
  
	belongs_to :team

	validates :team, :number, :nhl_website_id, {:presence => true}
	validates :nhl_website_id, {:uniqueness => true}
	validates :number, :length => {maximum: 2}

end
