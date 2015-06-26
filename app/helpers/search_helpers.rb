helpers do 

	def find_league
		League.find_by(abbreviation: params[:league_abbreviation].upcase)
	end

	def find_team
		Team.find_by(abbreviation: params[:team_abbreviation].upcase)
	end

end