def der(fp, f, h)
    method(
        define_method(fp) do |f, h, x|
            (f[x + h] - f[x]) / h
        end
    ).curry[f, h]
end

def der2(fp, f, h)
    method(
        define_method(fp) do |f, h, x|
            (f[x + 2 * h] - 2 * f[x + h] + f[x]) / h ** 2
        end
    ).curry[f, h]
end

d1 = der(:jeff0, ->(x) {x * x + x ** 0.5}, 0.0001)
d2 = der(:jeff1, ->(x) {Math.sin(x)}, 0.000001)
 
p d1[11]
p d2[0.25 * 3.1415926]

d3 = der2(:jeff3, ->(x) {x ** 3}, 0.000001)

p d3[1]


