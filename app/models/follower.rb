class Follower

    attr_reader :name, :age, :life_motto

    @@all = []

    def initialize(name, age, life_motto)
        @name = name
        @age = age
        @life_motto = life_motto
        @@all << self
    end

    def self.all
        @@all
    end

    def cults
        bloodoath_list = BloodOath.all.select { |bloodoath| bloodoath.follower == self }
        bloodoath_list.map { |bloodoath| bloodoath.cult }
    end

    def join_cult(cult)
        if self.age >= cult.minimum_age
            BloodOath.new(cult, self)
        else print "Too young, buddy"
        end
    end

    def self.of_a_certain_age(age)
        self.all.select { |follower| follower.age >= age }
    end

    def cults
        my_bloodoaths = BloodOath.all.select { |bloodoath| bloodoath.follower == self }
        my_cults = my_bloodoaths.map { |bloodoath| bloodoath.cult }
    end

    def my_cults_slogans
        my_cults = self.cults
        my_cults_slogans = my_cults.map { |cult| cult.slogan }
    end

    def self.most_active
        follower_index = self.all.map { |follower| follower.cults.length }.each_with_index.max[1]
        self.all[follower_index]
    end

    def fellow_cult_members
        my_cults = self.cults
        bloodoaths = my_cults.map.each { |cult| cult.bloodoaths }[0]
        friends = bloodoaths.map { |bloodoath| bloodoath.follower }.uniq
        friends.delete(self)
        friends
    end
end