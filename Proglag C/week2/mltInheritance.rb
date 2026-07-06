class Pt 
    attr_accessor :x, :y
    def distToOrigin
        Math.sqrt(x * x + y * y)
    end
end

class ColorPt < Pt 
    attr_accessor :color 
    def darken # error if @color not already set
        self.color = "dark " + self.color
    end
end

class Pt3D < Pt
    attr_accessor :z
    def distToOrigin
        Math.sqrt(x * x + y * y + z * z)
    end
end


# This code does not exist in Ruby (or Java/C#, it does in c++)
=begin
class ColorPt3D < ColorPt, Pt3D
    ..
end
=end

# they worked the same way, the only different is which method is inherting the parent's method in this case
class ColorPt3D_1 < ColorPt
    attr_accessor :z
    def distToOrigin
        Math.sqrt(x * x + y * y + z * z)
    end
end

class ColorPt3D_2 < Pt3D 
    attr_accessor :color
    def darken #error if @color not already set
        self.color = "dark " + self.color
    end
end

# Multiple Inheritance
=begin

if inheritance and overriding are so useful, why limit ourselves to one superclass?
    - Because the semantics is often awkward
    - Because it makes static type-checking harder
    - Because it makes efficient implementation harder

Is it useful? Sure!
    - Example: make a ColorPt3D by inheriting from Pt3D and ColorPt
    - Example: make a StudentAthlete by inhereting from Student and Athlete
    - With single inheritance, end up copying code or using non-OOP-style helper methods

=end






