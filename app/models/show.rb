class Show < ActiveRecord::Base
  def self.highest_rating
    Show.maximum :rating
  end

  def self.most_popular_show
    # Show.all.filter do |show|
    #   if show.rating = Show.maximum(:rating)
    #     return show
    #   end
    # end
    Show.order(:rating).last
  end

  def self.lowest_rating
    Show.minimum :rating
  end

  def self.least_popular_show
    Show.order(:rating).first
  end

  def self.ratings_sum
    Show.all.sum(:rating)
  end

  def self.popular_shows
    Show.where('rating > 5')
  end

  def self.shows_by_alphabetical_order
    Show.all.sort { |a, b| a.name <=> b.name }
  end
end
