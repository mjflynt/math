require "benchmark"

CASES = 1_000_000_000

class G 
    def initialize = @counter = 0

    def inc =  @counter += 1

    def counter = @counter

    def incG( repeat ) = repeat.times { @counter += 1}
end

class C 
    def initialize = spawner

    def def_meth( m, & ) = self.class.send( :define_method, m, & )

    def spawner
        counter = 0
        def_meth :inc do
            counter += 1
        end

        def_meth :counter do
            counter
        end

        def_meth :incL do |repeat| 
            repeat.times { counter += 1}
        end
    end
end

class I
    attr_accessor :total 

    def initialize
        @counter = 0
        @total = 0
    end

    def incG
        CASES.times { @counter += 1 }
    end

    def incL 
        counter = 0 
        CASES.times { counter += 1 }
        @total = counter
    end
end 

# g = G.new 
# puts Benchmark.measure { CASES.times { g.inc } }

puts "\n-= With Closures =-\n"
c = C.new
print "closure var ".ljust(25, '.')
puts Benchmark.measure { CASES.times { c.inc } }

g = G.new 
print "global var ".ljust(25, '.')
puts Benchmark.measure { CASES.times { g.inc } }

ic = C.new 
print "closure var repeat ".ljust(25, '.')
puts Benchmark.measure { ic.incL( CASES ) }

ig = G.new 
print "global var repeat ".ljust(25, '.')
puts Benchmark.measure {ig.incG( CASES ) }

i = I.new
puts "\n-= No Closures =-\n"
print "global var ".ljust(25, '.')
puts Benchmark.measure { i.incG } 
print "local var ".ljust(25, '.')
puts Benchmark.measure { i.incL }