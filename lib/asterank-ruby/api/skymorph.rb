module Asterank
  module API
    class Skymorph
      include HTTParty
      base_uri 'http://asterank.com/api/skymorph'
      attr_reader :results

      def initialize
        @results = nil
      end

      def results
        @results  
      end

      def search(target)
        @results = self.class.get('/search', query: {target: target})
      end

      def search_orbit(params)
        @results = self.class.get('/search_orbit', query: cleanup_orbit_params(params))
      end

      def search_position
        @results = self.class.get('/search_orbit', query: cleanup_position_params(params))
      end

      def image(key, filename, fast = true)
        if fast
          endpoint = '/fast_image'
        else
          endpoint = '/image'
        end
        @results = self.class.get(endpoint, query: {key: key})
        File.open(filename, 'wb') {|f| f.write @results.parsed_response }
      end

      private
        def cleanup_orbit_params(params)
          params.slice(
              :ecc,
              :epoch,
              :per,
              :per_date,
              :om,
              :w,
              :i,
              :H
            )
        end

        def cleanup_position_params(params)
          params.slice(
            :ra,
            :Dec,
            :time,
            :per_date,
            :om,
            :w,
            :i,
            :H 
          )
          
        end
    end
  end
end