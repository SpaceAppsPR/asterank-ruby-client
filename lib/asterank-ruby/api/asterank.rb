module Asterank
  module API
    class Asterank < MongoParty
      include Origin::Queryable
      include HTTParty
      base_uri 'http://asterank.com/api/asterank'
    end
  end
end