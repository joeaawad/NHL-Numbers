get '/leagues/:league_abbreviation/number' do
	@league = find_league
	@all_number_totals = @league.all_number_totals
	erb :'leagues/sort_number'
end

get '/leagues/:league_abbreviation/popularity' do
	@league = find_league
	@all_number_totals = @league.popularity_number_totals
	erb :'leagues/sort_popularity'
end

get '/leagues/:league_abbreviation/teams' do
	@league = find_league
	@teams = @league.teams
	erb :'teams/index'
end

get '/leagues/:league_abbreviation/teams/:team_abbreviation' do
	@league = find_league
	@team = find_team
	@players = @team.players.sort_by {|player| player.number}
	erb :'teams/show'
end

get '/leagues/:league_abbreviation/numbers/:number' do
	@league = find_league
	@players = @league.search_players_by_number(params[:number].to_i)
	erb :'leagues/show_number'
end
