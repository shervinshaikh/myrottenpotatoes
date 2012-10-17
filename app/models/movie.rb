class Movie < ActiveRecord::Base
  def self.getratings
    movie = self.find(:all, :select => 'DISTINCT rating')
    array = []
    movie.each do |t|
      array << t.rating
    end
    return array
  end
end
