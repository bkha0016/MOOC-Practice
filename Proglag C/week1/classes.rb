=begin

rules of class-based OOP

- all values are references to objects
- objects communicate via method calls, also known as messages
- each object has its own (private) state
- every object is an instance of a class
- An object's class determines the object's behavior
    - how it handles method calls
    - Class contains method definitions


=end

# Section 7: Classes and Objects

class A
    def m1
        34
    end

    def m2 (x,y)
        z = 7
        if x > y
            false
        else
            x + y * z
        end
    end
end

class B
    def m1
        4
    end
    def m3 x
        x.abs * 2 + self.m1  # self call another method on "same object" with self.m(...)
    end
end

class C
    def m1
        print "hi "
        self
    end
    def m2
        print "bye "
        self
    end
    def m3
        print "\n"
        self
    end
end

