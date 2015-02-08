require_relative 'movie'
require_relative 'rental'
require_relative 'customer'
require 'pry'
require 'pry-byebug'

require 'minitest/autorun'

describe "Movie rentals" do
  def setup
    @c = Customer.new("Jane")
    @m1 = Movie.new("1984", 0)
    @m2 = Movie.new("Platoon", 1)
    @r1 = Rental.new(@m1, 2)
    @r2 = Rental.new(@m2, 3)
    @c.add_rental(@r1)
    @c.add_rental(@r2)
  end

  it "correctly does statement" do
    stmt = @c.statement
    stmt.must_equal("Rental Record for Jane\n\t1984\t2\n\tPlatoon\t9\nAmount owed is 11\nYou earned 3 frequent renter points")
  end
end
