class Cult

    attr_accessor :location, :slogan, :minimum_age
    attr_reader :founding_year, :name
    @@all = []

    def initialize(name, location, founding_year, slogan, minimum_age)
        @name = name
        @location = location
        @founding_year = founding_year
        @slogan = slogan
        @@all << self
        @minimum_age = minimum_age
    end

    def self.all
        @@all
    end

    def self.find_by_name(sought_name)
        self.all.find{|c| c.name == sought_name}
    end

    def self.find_by_location(sought_location)
        self.all.find{|c| c.location == sought_location}
    end

    def self.find_by_founding_year(sought_year)
        self.all.find{|c| c.founding_year == sought_year}
    end

    def recruit_follower(follower)
        if follower.age < @minimum_age
            puts "You are too young to join cult."
            return nil
        end
        BloodOath.new(2019, follower, self)
    end

    def cult_population
        cult_followers.count
    end

    def cult_followers
        BloodOath.all.select{|b| b.cult == self}.map{|b| b.follower}
    end

    def average_age
        cult_followers.map{|f| f.age}.sum / cult_population.to_f
    end

    def my_followers_mottos
        cult_followers.map{|f| f.life_motto}
    end

    def self.least_popular
        self.all.min_by{|c| c.cult_population}
    end

    def self.most_popular_location
        cult_location = {}

        self.all.each do |c|
            if cult_location[c.location]
                cult_location[c.location] += 1
            else
                cult_location[c.location] = 1
            end
        end
        cult_location.max_by{|location, location_count| location_count}[0]
    end

end