
require_relative "../config/environment.rb"

def reload
  load "config/environment.rb"
end

# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

cult1 = Cult.new("J", "London", 1991, "Be cool!")
cult2 = Cult.new("A", "Bristol", 1999, "Rock it")
cult3 = Cult.new("B", "Barcelona", 2000, "Necer stop!")

f1 = Follower.new("Anji", 32, "life is perfect")
f2 = Follower.new("Anji", 30, "whatever")
f3 = Follower.new("Anji", 30, "hey")
f4 = Follower.new("Anji", 33, "life sucks")

cult1.name_
cult2.name_

cult1.location_
cult2.location_

cult1.founding_year_
cult3.founding_year_

cult1.slogan_
cult3.slogan_

cult1.recruit_follower(f1)
cult3.recruit_follower(f2)
cult1.recruit_follower(f1)
cult3.recruit_follower(f2)

cult2.cult_population
cult3.cult_population
cult1.cult_population

d = Cult.find_by_name("J")
l = Cult.find_by_location("Barcelona")
y = Cult.find_by_founding_year(1991)

puts "checking followers"

f2.cults

m = f3.join_cult(cult3)
a = Follower.of_a_certain_age(30)

binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
