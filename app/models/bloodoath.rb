class BloodOath
    
    require 'date'

    attr_reader :initiation_date, :cult, :follower

    @@all = []

    def initialize(cult, follower)
        @initiation_date = Date.today.to_s
        @cult = cult
        @follower = follower
        @@all << self
    end

    def self.all
        @@all
    end

    def self.first_oath
        self.all[0]
    end

end