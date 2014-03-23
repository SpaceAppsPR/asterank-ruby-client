class MongoParty

  attr_reader :results

  def initialize
    @results = nil
  end

  def results
    @results  
  end

  def execute
    limit = options[:limit] || 10
    query = {query: selector.to_json, limit: limit}
    @results = self.class.get('', query: query)
    return @results
  end
end