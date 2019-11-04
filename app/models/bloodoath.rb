class BloodOath

    attr_accessor :initation_date, :follower
    attr_reader :cult

@@all = []

    def initialize (initation_date, cult, follower)
        @initation_date = initation_date
        @cult = cult
        @follower = follower
        @@all << self
    end

    def self.all
        @@all 
    end

end 