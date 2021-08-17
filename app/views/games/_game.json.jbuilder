json.extract! game, :id, :home_team, :away_team, :start_time, :end_time, :created_at, :updated_at
json.url game_url(game, format: :json)
