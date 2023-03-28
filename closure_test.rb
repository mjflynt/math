

def outer1
    x = 0
    -> { x += 1 }
end

def outer2
    x = 0
    define_method(:inc_x) { x += 1 }
    define_method(:dec_x) { x -= 1 }
    define_method(:show_x) { x }
end

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
