require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

f1 = Follower.new('fred', 34, 'cult is life')
f2 = Follower.new('john', 66, "I love cults")
f3 = Follower.new('amy', 18, "cultscultscults")

c1 = Cult.new("Cul1", "London", 2008, "1Cult")
c2 = Cult.new("Cult2", "Paris", 2007, "2Cult")
c3 = Cult.new("Cult3", "New York", 2000, "3Cult")

b1 = BloodOath.new("2000-10-16" , c1, f1)
b2 = BloodOath.new("1999-08-10", c1, f1)
b3 = BloodOath.new("2004-09-09", c3, f3)

# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
