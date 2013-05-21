require 'httparty'

module Appfigures
  class Rank
    include HTTParty
    base_uri API_URL
    format :json
    
    def initialize(username, password)
      @auth = {:username => username, :password => password}
    end
    
    # Generating a Ranks Report
    def ranks(app_id, granularity, start_date, end_date, query = {})
      self.class.get("/ranks/#{app_id}/#{granularity}/#{start_date}/#{end_date}/", {:basic_auth => @auth, :query => query})
    end
  end
end