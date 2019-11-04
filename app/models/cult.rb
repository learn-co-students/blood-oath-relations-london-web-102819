class Cult

    attr_reader :cult, :location, :founding_year, :slogan

@@all = []

def initialize(name, location, founding_year, slogan)
    @name = name
    @location = location
    @founding_year = founding_year
    @slogan = slogan
    @@all << self

end 

def recruit_follower(follower)
   Bloodoath.new(follower, Initiation_date, self, followers)
end

def cult_population
    cult = BloodOath.all.select {|e| e.cult == self}
    cult.map{|e| e.follower}.size
end 

def self.all
    @@all
end 

def self.find_by_name(name)
    Follower.all.find {|follower| follower.name == self}
end 

def self.find_by_location(location)
    self.all.select {|cult| cult.location == location}.uniq
end 

def self.find_by_founding_year(year)
    self.all.select {|cult| cult.founding_year == year}
end 

end
