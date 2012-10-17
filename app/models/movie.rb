class Movie < ActiveRecord::Base
  def self.getratings
#    movie = self.find(:all, :select => 'DISTINCT rating')
#    array = []
#    movie.each do |t|
#      array << t.rating
#    end
#    return array
    return ['G', 'PG', 'PG-13', 'R']
  end
end
