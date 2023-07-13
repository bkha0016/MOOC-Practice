=begin 

Visibility

We know "hiding things" is essential for modularity and abstraction

OOP languages generally have various ways to hide (or not) instance variables,
methods, classes, etc.
    - Ruby is no exception

In Ruby, object state is always private
    - Only an object's methods can access its instance variables
    - Not even another instance of the same class
    - So can write @foo, but not e.@foo

To make object-state publicly visible, define "getters"/"setters"


Three visibilities for methods in Ruby:
    - Private: only available to object itself
    - Protected: available only to code in the class or subclasses
    - Public: availabel to all code

Methods are public by default
    - Multiple ways to change a method's visibility
    - Here is one way...

One detail:
    - If m is private, then you can only call it via m or m (args)
    - As usual, this is shorthand for self.m
    - But for private methods, only the shorthand is allowed


=end

#Public method: 
#called from anywhere, both within the class & outside of it

class MyClass
    def public_method
        private_method
        puts "This is a public method."
    end

    def protected_method
        puts "This is a protected method."
    end

    private

    def private_method
        puts "This is a private method."
    end

    protected :protected_method

end

#Protected method: is accesible within the class itself and its subclasses
#You cannot call it directly from an instance of the class ("obj1"). 
#Instead, you need to use a subclasss method to access the protected method

class MySubClass < MyClass
    def call_protected_method(other)
        other.protected_method
    end
end

obj1 = MyClass.new
obj1.public_method

#obj1.protected_method # Error: NoMethodError

obj2 = MySubClass.new
obj2.call_protected_method(obj1)

obj1.public_method #only access private method before it was being privated
#obj1.private_method








