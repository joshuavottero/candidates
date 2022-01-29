# This is the main entrypoint into the program
# It requires the other files/gems that it needs
require 'pp'
require './candidates'
require './filters'

## Your test code can go here
#puts Time.now()
#pp @candidates

candidates = @candidates

puts "find"
puts find(1)
candidates = qualified_candidates(candidates)
candidates = ordered_by_qualifications(candidates)

pp candidates



