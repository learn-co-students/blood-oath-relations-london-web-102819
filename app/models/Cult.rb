

class Cult
  attr_reader :name, :location, :found_year, :slogan

  @@all = []

  def initialize(name, location, found_year, slogan)
    @name = name
    @location = location
    @found_year = found_year
    @slogan = slogan
    @@all << self
  end

  def name_
    self.name
  end

  def location_
    self.location
  end

  def founding_year_
    self.found_year
  end

  def slogan_
    self.slogan
  end

  def recruit_follower(init_date, follower)
    BloodOath.new(self, follower, init_date)
  end

  def cult_population
    BloodOath.all.select { |b|
      b.cult == self
    }.size
  end

  def self.find_by_name(name)
    Cult.all.find { |c|
      c.name == name
    }
  end

  def self.find_by_location(loc)
    Cult.all.find { |c|
      c.location == loc
    }
  end

  def self.find_by_founding_year(year)
    Cult.all.select { |c|
      c.found_year == year
    }
  end

  def self.all
    @@all
  end
end
