class BloodOath
  attr_reader :initiation_date, :cult, :follower

  @@all = []
  def initialize(initiation_date, cult, follower)
    @initiation_date = initiation_date
    @cult = cult
    @follower = follower
    @@all << self
  end

  def self.all
    @@all
  end

  def all_years
  end

  # returns the `Follower` instance for the follower that made the very first blood oath
  def self.first_oath
    all_dates = self.all.map {|bo| bo.initiation_date}
    first_oath = all_dates.sort.first
  end

end