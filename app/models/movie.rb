class Movie < ActiveRecord::Base
  def self.getratings
#    movie = self.find(:all, :select => 'DISTINCT rating')
#    array = []
#    movie.each do |t|
#      array << t.rating
#    end
#    return array
    @selected_ratings = ['G', 'PG', 'PG-13', 'R']
    return @selected_ratings
  end
end
