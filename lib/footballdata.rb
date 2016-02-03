require "json"
require 'net/http'

require 'models/fixture'
require 'models/team'
require 'models/league'
require 'configuration'

BASE_URL = "http://api.football-data.org/v1"

module Footballdata
  def self.api_key
    Footballdata.configuration.api_key
  end

  def self.api_request(path)
    uri = URI([BASE_URL, path].join)
    req = Net::HTTP::Get.new(uri)
    req['X-Auth-Token'] = api_key

    response = Net::HTTP.start(uri.hostname, uri.port) do |http|
      http.request(req)
    end

    case response
    when Net::HTTPSuccess then
      response
    when Net::HTTPTooManyRequests then
      raise RuntimeError, "API limit reached"
    else
      response
    end
  end

  def self.leagues(season: current_season)
    response = Footballdata::api_request("/soccerseasons?season=#{season}")

    JSON.parse(response.body).map do |league|
      League.new(
        id: league["id"],
        name: league["caption"],
        number_of_teams: league["numberOfTeams"]
      )
    end
  end

  def self.team(id)
    response = Footballdata::api_request("/teams/#{id}")

    team = JSON.parse(response.body)
    id = team["_links"]["fixtures"]["href"].split("/")[-2]
    Team.new(
      id: id,
      name: team["name"],
      logo_url: team["crestUrl"],
    )
  end

  def self.current_season
    Time.now.month >= 7 ? Time.now.year : Time.now.year - 1
  end
end
