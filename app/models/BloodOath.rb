class BloodOath

    attr_reader :initiation_date, :follower, :cult
    @@all = []

    def initialize(initiation_date, follower, cult)
        @cult = cult
        @follower = follower
        @initiation_date = initiation_date
        @@all << self
    end

    def self.all
        @@all
    end

    def self.first_follower
        @@all[0].follower
    end
end