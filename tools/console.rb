require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

c1 = Cult.new('frantics','london',2010,'more is always better')
c2 = Cult.new('lunies','new york',2018,'quantity over quality')
c3 = Cult.new('ravers','shanghai',1998,'the sky is blue')

f1 = Follower.new('john',34,'to be or not to be')
f2 = Follower.new('james',57,'live or let die')
f3 = Follower.new('martin',13,'follow your heart')

b1 = BloodOath.new('2013',f1,c1)
b2 = BloodOath.new('2013',f2,c3)

c1.recruit_follower(f2)
c1.recruit_follower(f3)

f2.join_cult(c2)


binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
