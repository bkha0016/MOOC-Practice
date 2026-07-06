=begin 

Subclasses, inheritance, and overriding
- The essence of OOP
- Not unlike you may have seen in Java/C#/C++/Python, but worth studying
from PL perspective and in a more dynamic language

- The superclass affects the class definition:
    - Class inherits all method definitions from superclass
    - But class can override method definitions as desired

- Unlike Java/C#/C++
    - No such thing as "inherting fields" since all objects create
instance variables by assigning to them
    - Subclassing has nothing to do with a (non-existent) type system
        can still (try to) call any method on any object


=end

class Point

    attr_accessor :x, :y #define methods x, y, x=, y=

    def initialize(x,y)
        @x = x
        @y = y
    end

    def distFromOrigin
        Math.sqrt(@x * @x + @y * @y) # uses instance variables
    end

    def distFromOrigin2
        Math.sqrt(x * x + y * y) # uses getter methods
    end
end

class ColorPoint < Point
    #By calling super(x, y), the ColorPoint class inherits the behavior of the Point class's initialize method and 
    #adds its own custom behavior by setting the @color instance variable to the value of c.
    attr_accessor :color 

    def initialize(x,y,c="clear")
        super(x,y) #keyword super calls same method in superclass
        @color = c 
    end
end




