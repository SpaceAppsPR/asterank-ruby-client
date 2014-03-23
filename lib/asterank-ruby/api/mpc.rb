module Asterank
  module API
    class MPC < MongoParty
      include Origin::Queryable
      include HTTParty
      base_uri 'http://asterank.com/api/mpc'
    end
  end
end