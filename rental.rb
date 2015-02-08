# A rental event
class Rental
  attr_reader :movie, :days_rented

  def initialize(movie, days_rented)
    @movie, @days_rented = movie, days_rented
  end

  def charge
    amount = 0
    case movie.price_code
    when Movie::REGULAR
      amount += 2
      amount += (days_rented - 2) * 1.5 if days_rented > 2
    when Movie::NEW_RELEASE
      amount += days_rented * 3
    when Movie::CHILDRENS
      amount += 1.5
      amount += (days_rented - 3) * 1.5 if days_rented > 3
    end
    amount
  end

  def points_for_freq_renters
    frequent_renter_points = 1

    # add bonus for a two day new release rental
    if movie.price_code == Movie::NEW_RELEASE && days_rented > 1
        frequent_renter_points += 1
    end
    frequent_renter_points
  end
end