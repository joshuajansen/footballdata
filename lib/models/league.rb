module Footballdata
  class League
    attr_reader :id, :name

    def initialize(id:, name:)
      @id = id
      @name = name
    end

    def teams
      open("#{BASE_URL}/soccerseasons/#{id}/teams", "X-Auth-Token" => api_key) do |response|
        JSON.parse(response.read)["teams"].map do |team|
          id = team["_links"]["fixtures"]["href"].split("/")[-2]
          Footballdata::Team.new(
            id: id,
            name: team["name"]
          )
        end
      end
    end

    def fixtures
      open("#{BASE_URL}/soccerseasons/#{id}/fixtures", "X-Auth-Token" => api_key) do |response|
        JSON.parse(response.read)["fixtures"].map do |team|
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
end
