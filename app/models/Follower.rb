class Follower
  attr_reader :name, :age, :life_motto

  @@all = []

  def initialize(name, age, life_motto)
    @name = name
    @age = age
    @life_motto = life_motto
    @@all << self
  end

  def name_
    self.name
  end

  def age_
    self.age
  end

  def life_motto_
    self.life_motto
  end

  def cults
    the_cults = []
    BloodOath.all.each { |b|
      if b.follower == self
        the_cults << b.cult
      end
    }
    the_cults
  end

  def join_cult(cult)
    date = Time.at(rand * Time.now.to_i)
    BloodOath.new(cult, self, date)
  end

  def self.all
    @@all
  end

  def self.of_a_certain_age(age)
    self.all.select { |f|
      f.age == age
    }
  end
end
