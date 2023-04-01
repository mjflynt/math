
def f(&)
    g(&)
end

def g(&b)
    # yield
    b.call
end

f {p "hello!"}

