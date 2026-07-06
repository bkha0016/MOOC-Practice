# Overriding and Dynamic Dispatch

class Point
    attr_accessor :x, :y 

    def initialize(x,y)
        @x = x
        @y = y 
    end

    def distFromOrigin 
        Math.sqrt(@x * @x + @y * @y) #uses instance variables
    end

    def distFromOrigin2
        Math.sqrt(x * x + y * y) # uses getter methods
    end

end

class ThreeDPoint < Point 
    attr_accessor :z #getter methods

    def initialize(x,y,z)
        super(x,y)
        @z = z
    end
    def distFromOrigin
        d = super #calculates the distFromOrigin & store the result in the variable D
        Math.sqrt(d * d + @z * @z)
    end
    def distFromOrigin2
        d = super #calculates the distFromOrigin2 & store the result in the varible D
        Math.sqrt(d * d + z * z)
    end
end


=begin 


With examples so far, objects are not so different from closures
    - multiple methods rather than just "call me"
    - Explicit instance variables rather than environemtn where function is defined
    - Inheritance avoids helper functions or code copying
    - "Simple" overriding just replaces methods


=end

class PolarPoint < Point 
    # By not calling super constructor, no x and y instance variable

    def initialize(r, theta)
        @r = r 
        @theta = theta 
    end
    def x #getter method
        @r * Math.cos(@theta)
    end
    def y 
        @r * Math.sin(@theta)
    end
    def x= a #setter method
        b = y # avoid mutliple calls to y method
        @theta = Math.atan(b / a)
        @r = Math.sqrt(a*a + b*b)
        self
    end
    def y= b 
        a = y # avoid multiple calls to y method
        @theta = Math.atan(b / a)
        @r = Math.sqrt(a*a + b*b)
        self
    end
    def distFromOrigin #must override --> it doesnt override the method from the superclass
        @r 
    end
end









