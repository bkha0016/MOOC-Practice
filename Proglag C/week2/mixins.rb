=begin
Mixin is (just) a collection of methods
    - Less than a class: no instances of it

Languages with mixins (Ruby modules) typically let a class have one superclass but include
number of mixins

Semantics: Including a mixin makes its methods part of the class
    - Extending or overriding in the order mixins are included in the class definition
    - More powerful than helper methods because mixin methods can access methods (and instance variables) on self not defined in the mixin


=end

module Doubler
    def double 
        self + self  # uses self's + message, not defined in doubler
    end
end

class Pt
    attr_accessor :x, :y
    include Doubler
    def + other
        ans = Pt.new
        ans.x = self.x + other.x
        ans.y = self.y + other.y
        ans
    end
end

class String
    include Doubler
end




