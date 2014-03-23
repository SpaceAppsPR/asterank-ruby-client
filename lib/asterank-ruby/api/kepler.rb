module Asterank
  module API
    class Kepler < MongoParty
      include Origin::Queryable
      include HTTParty
      base_uri 'http://asterank.com/api/kepler'
    end
  end
end