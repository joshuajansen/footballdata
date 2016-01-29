![Codeship](https://codeship.com/projects/380af8b0-a881-0133-6083-4ae619b9c646/status?branch=master)


# FootballData

Wrapper for the football-data.org API.

## Installation
Add this to your application's Gemfile:

    gem "footballdata", "~> 0.1"

And then execute:

    $ bundle

## Example usage

Currently, this wrapper supports fetching leagues, teams and their fixtures.

``` ruby
$ Footballdata.leagues
# This will return an Array with the available leagues.
```

``` ruby
$ Footballdata.leagues.first.fixtures
# This will return an Array with the fixtures for this league's current season.
```

``` ruby
$ Footballdata.leagues.first.teams
# This will return an Array with the first league's teams.
```

``` ruby
$ Footballdata.leagues.first.teams.first.fixtures
# This will return an Array with the first team's fixtures.
```

## Configuration

If you've got an API key from football-data.org, you can set this via either an initializer:

```ruby
# config/initializers/football_data.rb
Footballdata.configure do |config|
  config.api_key = "YOURAPIKEY"
end
```

Or via an environment variable:

```ruby
ENV["API_KEY"] = "YOURAPIKEY"
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
