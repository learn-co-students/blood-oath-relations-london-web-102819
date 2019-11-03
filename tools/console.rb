require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

################# Cult Class test ###############
#(name, location, founding_year, slogan)
c1 = Cult.new("Flatiron", "New York", 2019, "Flatiron is the best!" )
c2 = Cult.new("Makers", "London", 1987, "Makers is the best!" )
c3 = Cult.new("GA", "London", 2000, "GA is the best!" )

################# Follower Class test ###############
#(name, age, life_motto)
f1 = Follower.new("Qing", 20, "Ruby is fun!")
f2 = Follower.new("Alice", 33, "PHP is fun!")
f3 = Follower.new("Tom", 40, "Breathe In Courage, Breathe Out Fear")
f4 = Follower.new("Chris",70, "Have Courage And Be Kind")
f5 = Follower.new("Lily",60, "Successful People Do Things When They Don’t Want To")
f6 = Follower.new("Sue",80, "Rome Was Not Built In A Day")
f7 = Follower.new("Jamie",50, "Be The One To Light A Fire")
f8 = Follower.new("Alison",58, "Life is fun!")
f9 = Follower.new("Tony",56, "Throw Me To The Wolves And I Will Return Leading The Pack")
f10 = Follower.new("Ian",90, "I Will Survive")
f11 = Follower.new("Harry",100, "Every Wall Is A Door")


################# BloodOat Class test ###############
#(initiation_date, cult, follower)
BloodOath.new("2019-03-01", c1, f2 )
BloodOath.new("2018-04-04", c2, f2 )
BloodOath.new("2017-05-10", c1, f3 )
BloodOath.new("2016-06-15", c3, f4 )
BloodOath.new("2015-07-16", c2, f2)
BloodOath.new("2013-08-29", c3, f5 )
BloodOath.new("2008-12-01", c1, f6 )
BloodOath.new("2007-05-05", c1, f7 )
BloodOath.new("2006-08-22", c3, f8 )
BloodOath.new("2005-04-30", c2, f9 )
BloodOath.new("2003-10-29", c1, f10 )
BloodOath.new("2000-02-21", c3, f1 )
BloodOath.new("2020-01-08", c2, f1 )
BloodOath.new("1920-03-15", c1, f11 )


binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
