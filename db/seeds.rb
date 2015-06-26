nhl = League.create!(name: "National Hockey League",abbreviation: "NHL")

teams = [
	["Anaheim", "Ducks", "ANA"],
	["Arizona", "Coyotes", "ARI"],
	["Boston", "Bruins", "BOS"],
	["Buffalo", "Sabres", "BUF"],
	["Calgary", "Flames", "CGY"],
	["Carolina", "Hurricanes", "CAR"],
	["Chicago", "Blackhawks", "CHI"],
	["Colorado", "Avalanche", "COL"],
	["Columbus", "Blue Jackets", "CBJ"],
	["Dallas", "Stars", "DAL"],
	["Detroit", "Red Wings", "DET"],
	["Edmonton", "Oilers", "EDM"],
	["Florida", "Panthers", "FLA"],
	["Los Angeles", "Kings", "LAK"],
	["Minnesota", "Wild", "MIN"],
	["Montreal", "Canadiens", "MTL"],
	["Nashville", "Predators", "NSH"],
	["New Jersey", "Devils", "NJD"],
	["New York", "Islanders", "NYI"],
	["New York", "Rangers", "NYR"],
	["Ottawa", "Senators", "OTT"],
	["Philadelphia", "Flyers", "PHI"],
	["Pittsburg", "Penguins", "PIT"],
	["San Jose", "Sharks", "SJS"],
	["St. Louis", "Blues", "STL"],
	["Tampa Bay", "Lightning", "TBL"],
	["Toronto", "Maple Leafs", "TOR"],
	["Vancouver", "Canucks", "VAN"],
	["Washington", "Capitals", "WSH"],
	["Winnipeg", "Jets", "WPG"],
	]

teams.each do |team|
	nhl.teams.create!(location: team[0], nickname: team[1], abbreviation: team[2])
end

# http://hfboards.hockeysfuture.com/showthread.php?t=1596119

nhl.teams.each do |team|
	response = HTTParty.get("http://nhlwc.cdnak.neulion.com/fs1/nhl/league/teamroster/#{team.abbreviation}/iphone/clubroster.json")
	body = JSON.parse(response.body)
	body['goalie'].each do |player|
		team.players.create(nhl_website_id: player['id'],number: player['number'],position: player['position'],name: player['name'])
	end
	body['defensemen'].each do |player|
		team.players.create(nhl_website_id: player['id'],number: player['number'],position: player['position'],name: player['name'])
	end
	body['forwards'].each do |player|
		team.players.create(nhl_website_id: player['id'],number: player['number'],position: player['position'],name: player['name'])
	end
end