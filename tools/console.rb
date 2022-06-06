require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

ydn = Cult.new("YDN", "Yale", "To criticize Yale", 1899)
apple = Cult.new("Apple", "CA", "For privacy", 1999)

ryan = Follower.new("Ryan", 21, "For Hong Kong")
toby = Follower.new("Toby", 34, "ewwww green texts")

ryan.join_cult(ydn)

apple.recruit_follower(toby)

binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits