# A rental event
class Rental
  attr_reader :movie, :days_rented

  def initialize(movie, days_rented)
    @movie, @days_rented = movie, days_rented
  end

  def charge
    @movie.cost(@days_rented)
  end

  def points_for_freq_renters
    @movie.freq_renters_points(@days_rented)
  end
end