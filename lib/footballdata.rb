require "json"
require "open-uri"

require 'models/fixture'
require 'models/team'
require 'models/league'
require 'configuration'

BASE_URL = "http://api.football-data.org/v1"

def api_key
  Footballdata.configuration.api_key
end

module Footballdata
  def self.leagues(season: current_season)
    open("#{BASE_URL}/soccerseasons?season=#{season}", "X-Auth-Token" => api_key) do |response|
      JSON.parse(response.read).map do |league|
        League.new(
          id: league["id"],
          name: league["caption"]
        )
      end
    end
  end

  def self.team(id)
    open("#{BASE_URL}/teams/#{id}", "X-Auth-Token" => api_key) do |response|
      team = JSON.parse(response.read)
      id = team["_links"]["fixtures"]["href"].split("/")[-2]
      Team.new(
        id: id,
        name: team["name"]
      )
    end
  end

  def self.current_season
    Time.now.month >= 7 ? Time.now.year : Time.now.year - 1
  end
end
