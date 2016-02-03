module Footballdata
  class League
    attr_reader :id, :name, :number_of_teams

    def initialize(id:, name:, number_of_teams:)
      @id = id
      @name = name
      @number_of_teams = number_of_teams
    end

    def teams
      response = Footballdata::api_request("/soccerseasons/#{id}/teams")
      JSON.parse(response.body)["teams"].map do |team|
        id = team["_links"]["fixtures"]["href"].split("/")[-2]
        Footballdata::Team.new(
          id: id,
          name: team["name"],
          logo_url: team["crestUrl"],
        )
      end
    end

    def fixtures(timeframe: "n#{self.number_of_teams}")
      response = Footballdata::api_request("/soccerseasons/#{id}/fixtures?timeFrame=#{timeframe}")

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
