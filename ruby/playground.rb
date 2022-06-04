def gfg
   yield 2*3
   puts "In the method gfg"
   yield 100
end
gfg {|i| puts "block #{i}"}