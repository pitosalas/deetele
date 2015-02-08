# A movie that can be rented
class Movie
  attr_reader :title

  def initialize(title)
    @title = title
  end 

  def freq_renters_points(days)
    1
  end
end

class RegularMovie < Movie
  def cost(days)
    if days > 2
      2 + (days - 2) * 1.5
    else
      2
    end
  end
end

class NewReleaseMovie < Movie
  def cost(days)
    days * 3
  end

  def freq_renters_points(days)
    days <= 1 ? 1 : 2
  end
end

class ChildrensMovie < Movie
  def cost(days)
    if days > 3
      1.5 + (days - 3) * 1.5
    else
      1.5
    end
  end
end 


