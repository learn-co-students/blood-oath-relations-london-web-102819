class Follower

    attr_accessor :life_motto
    attr_reader :name, :age

@@all = []

    def initialize(name, age, life_motto)
        @name = name
        @age = age
        @life_motto = life_motto
        @@all << self
    end 

    def cults
      BloodOath.all.map(&:follower)
    end 

    def join_cult(cult)
        BloodOath.new(initiation_date, cult, self)
    end 

    def self.of_a_certain_age(age)
        self.all.select {|follower| follower.age >= age}
    end 

end 