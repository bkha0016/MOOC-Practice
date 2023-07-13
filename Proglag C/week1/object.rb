=begin

Object have state
- An object's state presits
    - Can grow & change from time object is created
- State only directly accesible from object's methods
    - Can read, write, extend the state
    - Effects persists for next method call
- State consists of instance variables (also known as fields)
    - @foo


=end

# Variable @foo can be accessed all over the methods
# instance variable must be declared using @
# in Ruby, different instances of same class can have different instance variables
# @variables only availaible for its own method, to make it work on all the methods you need to initialize them
# @@variables does not need initialize method because it becomes a class variable by its own


class A
    def initialize(f=0)
        @foo = f
    end
    def m1
        @foo = 0
    end

    def m2 x
        @foo += x
        @bar = 0
    end

    def foo
        @foo
    end

end


# the difference between class_method and instance method
# for class method you do not need to create an instance, therefore directly accesing the class method
# while a instance method you need to create the instance, before outputing anything

=begin 

class MyClass
  @@class_variable = 10
  @instance_variable = 20

  def self.class_method
    puts @@class_variable
  end

  def instance_method
    puts @instance_variable
  end
end

# Accessing class method
MyClass.class_method
# Output: 10

# Creating an instance and accessing instance method
my_obj = MyClass.new
my_obj.instance_method
# Output: 20

=end

# The differences between class constants & class variables

=begin 


In summary, class constants are used for values that 
are intended to remain constant throughout the execution of 
the program 
and can be accessed from both class methods and instance methods. 
Class variables, 
on the other hand, are shared among all instances of a class, 
allow for inheritance, and can hold different values 
for different subclasses.

====================================================
        |     Functional        |       OOP
======= | ==========================================
Static  |        SML            |       Java
        |                       |
======= | ======================|===================
        |                       |
Dynamic |      Racket           |       Ruby
======= | ======================|===================

*you could even say that Ruby is the easier OOP version of Java


=end

class C 
    Dans_age = 38

    def self.reset_bar
        @@bar = 0
    end

    def initialize(f=0)
        @foo = f 
    end

    def m2 x
        @foo += x
        @@bar += 1
    end

    def foo
        @foo
    end
    
    def bar
        @@bar
    end
end








