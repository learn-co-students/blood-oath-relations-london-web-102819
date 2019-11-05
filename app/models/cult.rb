class Cult

    attr_reader :name, :location, :founding_year, :slogan, :minimum_age

    @@all = []

    def initialize(name, location, founding_year, slogan, minimum_age=0)
        @name = name
        @location = location
        @founding_year = founding_year
        @slogan = slogan
        @minimum_age = minimum_age
        @@all << self
    end

    def self.all
        @@all
    end

    def recruit_follower(follower)
        if follower.age >= self.minimum_age
            BloodOath.new(self, follower)
        else print "Too young, buddy"
        end
    end

    def cult_population
        BloodOath.all.select { |bloodoath| bloodoath.cult == self }.length
    end

    def self.find_by_name(cult_name)
        self.all.select { |cult| cult.name == cult_name }
    end

    def self.find_by_location(cult_location)
        self.all.select { |cult| cult.location == cult_location }
    end

    def self.find_by_founding_year(year)
        self.all.select { |cult| cult.founding_year == year }
    end

    def bloodoaths
        BloodOath.all.select { |bloodoath| bloodoath.cult == self }
    end

    def average_age
        bloodoaths = self.bloodoaths
        ages = bloodoaths.map { |bloodoath| bloodoath.follower.age }
        ages.sum.to_f / ages.length
    end

    def my_followers_mottos
        bloodoaths = self.bloodoaths
        mottos = bloodoaths.map { |bloodoath| bloodoath.follower.life_motto }
        print mottos
    end

    def self.least_popular
        min_cult_populations = self.all.map { |cult| cult.cult_population }.min
        cult_s_with_min_population = self.all.select { |cult| cult.cult_population == min_cult_populations}
        if cult_s_with_min_population.length > 1
            cult_names = cult_s_with_min_population.map { |cult| cult.name }
            print "The cults with equal minimum members are #{cult_names}."
        else print "The cult with the minimum amount of members is #{cult_s_with_min_population[0].name}."
        end
    end

    def self.most_common_location
        arr = Cult.all.map { |cult| cult.location }
        freq = arr.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
        arr.max_by { |v| freq[v] }
    end




end