module Footballdata
  class Configuration
    attr_accessor :api_key

    def initialize
      @api_key = ENV["API_KEY"]
    end
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configuration=(config)
    @configuration = config
  end

  def self.configure
    yield configuration
  end
end
