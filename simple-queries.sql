--stadium_data queries

--shows all stadiums with open type
select stadium_name from football_data.stadium_data
where stadium_type = "open"
order by stadium_name asc

--shows all stadiums that opened before 2000
select stadium_name, stadium_open from football_data.stadium_data
where stadium_open < 2000
order by stadium_open asc

--shows all stadiums that opened during or after 2000
select stadium_name, stadium_open from football_data.stadium_data
where stadium_open >= 2000
order by stadium_open desc

--team_data queries

--shows all teams that changed division in 2002
select team_name, team_division, team_division_pre2002 from football_data.team_data
where team_division <> team_division_pre2002
order by team_name asc

--shows all AFC teams
select team_name, team_conference from football_data.team_data
where team_conference = "AFC"
order by team_name asc

--shows teams that changed conferences in 2002
select team_name, team_conference, team_conference_pre2002 from football_data.team_data
where team_conference <> team_conference_pre2002
order by team_name asc

--score_data queries

--shows road games where chicago was favored
select schedule_date, spread_favorite from football_data.score_data
where team_away = "Chicago Bears" and team_favorite_id = "CHI"
order by schedule_date asc

--shows games with large spreads
select schedule_date, team_favorite_id, spread_favorite from football_data.score_data
where spread_favorite < -15
order by spread_favorite asc

--shows Dallas' home playoff wins
select schedule_date, score_home - score_away from football_data.score_data
where team_home = "Dallas Cowboys" and schedule_playoff = True and score_home - score_away > 0
order by schedule_date desc
