class Follower

    attr_accessor :age
    attr_reader :name, :life_motto
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

    def self.of_a_certain_age(given_age)
        self.all.select{|f| f.age >= given_age}
    end

    def cults
        BloodOath.all.select{|b| b.follower == self}.map{|b| b.cult}
    end

    def join_cult(cult)
        if @age < cult.minimum_age
            puts "You are too young to join cult."
            return nil
        end
        BloodOath.new(2019, self, cult)
    end

    def my_cults_slogans
        cults.map{|c| c.slogan}
    end

    def self.most_active
        self.all.max_by{|f| f.cults.count}
    end

    def self.top_ten
        self.all.sort_by{|f| f.cults.count}[-10..-1]
    end

    def fellow_cult_members
        fcm = []
        self.cults.each do |c|
            c.cult_followers.each do |f|
                next if fcm.include?(f)
                fcm << f
            end
        end
        fcm.delete(self)
        fcm
    end
end