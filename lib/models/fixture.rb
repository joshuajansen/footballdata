module Footballdata
  class Fixture
    def initialize(id:, soccerseason_id:, date:, matchday:, home_team_name:, home_team_id:,
                   away_team_name:, away_team_id:, goals_home_team:, goals_away_team:)
      @id = id
      @soccerseason_id = soccerseason_id
      @date = date
      @matchday = matchday
      @home_team_name = home_team_name
      @home_team_id = home_team_id
      @away_team_name = away_team_name
      @away_team_id = away_team_id
      @goals_home_team = goals_home_team
      @goals_away_team = goals_away_team
    end
  end
end
