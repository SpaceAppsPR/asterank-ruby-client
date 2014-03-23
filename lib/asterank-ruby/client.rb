module Asterank
  class Client

    def mpc
      Asterank::API::MPC.new
    end

    def kepler
      Asterank::API::Kepler.new
    end

    def asterank
      Asterank::API::Asterank.new
    end

    def skymorph
      Asterank::API::Skymorph.new
    end
  end
end