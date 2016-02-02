module Footballdata
  class Team
    attr_reader :id, :name

    def initialize(id:, name:)
      @id = id
      @name = name
    end

    def fixtures
      response = Footballdata::api_request("/teams/#{id}/fixtures")

      JSON.parse(response.body)["fixtures"].map do |team|
        Footballdata::Fixture.new(
          id:              team["id"],
          soccerseason_id: team["soccerseasonId"],
          date:            team["date"],
          matchday:        team["matchday"],
          home_team_name:  team["homeTeamName"],
          home_team_id:    team["homeTeamId"],
          away_team_name:  team["awayTeamName"],
          away_team_id:    team["awayTeamId"],
          goals_home_team: team["result"]["goalsHomeTeam"],
          goals_away_team: team["result"]["goalsAwayTeam"]
        )
      end
    end
  end
end
