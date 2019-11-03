class Cult
  attr_reader :name, :location, :founding_year, :slogan

  @@all = []
  def initialize(name, location, founding_year, slogan)
    @name = name
    @location = location
    @founding_year = founding_year
    @slogan = slogan
    @@all << self
  end

  def self.all
    @@all
  end

  def followers
    BloodOath.all.select {|bo| bo.cult == self}
  end

  def followers_list
    followers.map {|f| f.follower}
  end

  #adds them to this cult's list of followers
  ##(initiation_date, cult, follower)
  def recruit_follower(initiation_date, follower)
    BloodOath.new(initiation_date, self, follower)
  end

 #returns a `Float` that is the average age of this cult's followers
  def average_age
    total_age = followers_list.map {|f| f.age}
    average = total_age.sum / total_age.size
  end
  
  #prints out all of the mottos for this cult's followers
  def my_followers_mottos
    followers_list.map {|f| f.life_motto}
  end

   #returns a `Fixnum` that is the number of followers in this cult
   def cult_population
    followers_list.size
  end

  #returns the `Cult` instance who has the least number of followers :(
  def self.least_popular
    least_popular_cult = self.all[0]
    self.all.each do |c|
      if c.cult_population < least_popular_cult.cult_population
        least_popular_cult = c
      end
    end
    least_popular_cult
  end

  #returns a `String` that is the location with the most cults
  def self.most_common_location
    location_counts = {}
    top_location_name = ""
    top_location_count = 0
    self.all.each do |c|
      if location_counts[c.location] == nil
        location_counts[c.location] = 0
      end
      location_counts[c.location] += 1
      if location_counts[c.location] > top_location_count
        top_location_name = c.location
        top_location_count = location_counts[c.location]
      end
    end
    top_location_name
  end

end