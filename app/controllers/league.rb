get '/leagues/:league_abbreviation/number' do
	@league = find_league
	@all_number_totals = @league.all_number_totals
	erb :'leagues/number'
end

get '/leagues/:league_abbreviation/popularity' do
	@league = find_league
	@all_number_totals = @league.all_number_totals.sort_by {|key,value| value.length}.reverse
	erb :'leagues/popularity'
end

get '/leagues/:league_abbreviation/teams' do
	@league = find_league
	@teams = @league.teams
	erb :'teams/index'
end