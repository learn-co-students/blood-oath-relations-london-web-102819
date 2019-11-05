require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

follower1 = Follower.new('Mike', 30, 'money is god')
follower2 = Follower.new('Steve', 25, 'money is god')
follower3 = Follower.new('Bob', 40, 'money is god')
follower4 = Follower.new('Nosferatu', 3000, 'i killed god')
follower5 = Follower.new('Stefano', 22, 'money is good, but chilling is better')
follower6 = Follower.new('Jeff', 26, 'what is money')

amazon = Cult.new('Amazon', 'everywhere', 1990, 'we are money')
bevs = Cult.new('Brewdog', 'chicago', 2005, 'C O N S U M E')
chicagonners = Cult.new("Chicagonners", 'chicago', 826, 'no young blood allowed', 1000)

follower1.join_cult(amazon)
follower2.join_cult(amazon)
follower3.join_cult(amazon)
bevs.recruit_follower(follower6)
bevs.recruit_follower(follower5)
bevs.recruit_follower(follower4)
follower3.join_cult(bevs)
follower5.join_cult(amazon)
follower4.join_cult(chicagonners)
follower4.join_cult(amazon)

binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
