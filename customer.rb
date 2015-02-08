# A customer of the store
class Customer
  attr_reader :name
  
  def initialize(name)
    @name = name
    @rentals = []
  end

  def add_rental(arg)
    @rentals << arg
  end

  def statement
    total_amount, frequent_renter_points = 0, 0
    result = statement_hdr()

    @rentals.each do |rental|
      frequent_renter_points += rental.points_for_freq_renters

      # show figures for this rental
      result += statement_line(rental.movie.title, rental.charge.to_s)
      total_amount += rental.charge
    end

    # add footer lines
    result += statement_ftr(total_amount, frequent_renter_points)
  end

  def statement_hdr
    "Rental Record for #{@name}\n"
  end

  def statement_line(title, charge)
    "\t#{title}\t#{charge}\n"
  end

  def statement_ftr(tot_amt, freq_points)
    "Amount owed is #{tot_amt}\nYou earned #{freq_points} frequent renter points"
  end


end
