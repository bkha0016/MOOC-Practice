# Consider alternatives to:

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

#Here subclassing is a good choice, but programmers often overuse subclassing in OOP languages

=begin 

Why subclass?
    Instead of creating ColorPoint, could add methods to Point
        - That could mess up other users and subclassers of Point
    Instead of subclassing Point, could use a Point instance variable
        - Define methods to send same messasge to the Point
        - Often OOP programmers overuse subclassing
        - But for ColorPoint, subclassing makes sense: less work and 
          can use a ColorPoint wherever code expects a Point  

=end

class ColorPoint
    attr_accessor :color

    def initialize(x,y, c="clear")
        @pt = Point.new(x,y)
        @color = c 
    end
    def x 
        @pt.x
    end
        # similar "forwarding" methods
        # for y, x= ,y=
end
