

def outer1
    x = 0
    -> { x += 1 }
end

def outer2
    p self, self.class
    x = 0
    define_method(:inc_x) { x += 1 }
    define_method(:dec_x) { x -= 1 }
    define_method(:show_x) { x }
end


class Closure
    def outer3
        x = 0
        Closure.define_method(:inc_x) { x += 1 }
        Object.define_method(:dec_x) { x -= 1 }
        Object.define_method(:show_x) { x }
    end
end

p Closure.ancestors


h = Closure.new.outer3
(1..10).each { p h.inc_x }

p h.respond_to? :inc_x

exit

j = outer1
(1..10).each { p j[] }
p j[]
p j[]

p outer2
p Object::inc_x()
p inc_x
p show_x
undef inc_x
# p inc_x
p show_x
p dec_x
p show_x
