require 'minitest/autorun'
require 'footballdata'

class TestFootballdata < Minitest::Test
  def test_leagues_fetches_major_leagues
    leagues = Footballdata.leagues

    assert leagues.first.is_a? Footballdata::League
    assert leagues.first.teams.first.is_a? Footballdata::Team
    assert leagues.first.fixtures.first.is_a? Footballdata::Fixture
  end

  def test_find_team_returns_team
    team = Footballdata.team(1)

    assert team.is_a? Footballdata::Team
    assert team.fixtures.first.is_a? Footballdata::Fixture
  end
end
