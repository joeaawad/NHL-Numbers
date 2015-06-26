helpers do 

	def find_league
		League.find_by(abbreviation: params[:league_abbreviation].upcase)
	end

end