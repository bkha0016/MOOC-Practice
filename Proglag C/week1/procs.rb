=begin 
Blocks are "second class"

All a method can do with a block is yield to it
    - cannot return it, store it in an object (e.g for a call back)
    - but can also turn blocks into real closures
    - closures are instances of class Proc
        called with a method call

    - blcoks are "second class"
    - procs are "first-class expressions"







=end

a = [3,5,7,9]
b = a.map {|x| x + 1}
i = b.count{|x| x >= 6}

#c = a.map {|x| {|y| x >= y}} <-- ERROR

#to fix it you need lambda
c = a.map {|x| (lambda {|y| x >= y})}

c[2].call 17


