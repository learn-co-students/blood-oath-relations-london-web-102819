require "pry"

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
    my_blood_oath = BloodOath.all.select {|bo| bo.follower == self}
    my_blood_oath.map {|c| c.cult}
  end

  def join_cult(initiation_date, cult)
    BloodOath.new(initiation_date, cult, self)
  end

  #takes a `Fixnum` argument that is an age and returns an `Array` of 
  #followers who are the given age or older
  def self.of_a_certain_age(age_lookup)
    self.all.select {|f| f.age >= age_lookup}
  end

  def my_cults_slogans
    cults.map {|c| c.slogan}
  end

  def total_cults
    cults.size
  end

  #returns the `Follower` instance who has joined the most cults
  def self.most_active
    most_active_follower = self.all[0]
    self.all.each do |f|
      if f.total_cults > most_active_follower.total_cults
        most_active_follower = f
      end
    end
    most_active_follower
  end

  #returns an `Array` of followers; they are the ten most active follower
  def self.top_ten
   self.all.sort_by {|f| f.total_cults}.reverse.slice(0,10)
  end


end
