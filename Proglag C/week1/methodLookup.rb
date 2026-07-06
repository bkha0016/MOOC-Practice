=begin 

            e0.m(e1,...,en)
To implement dynamic dispatch, evaluate the method body with 
self mappign to the receiver (result of e0)

- That way, any self calls in body of m use the receiver's class,
    - Not necessarily the class that defined m

- This much is the same in Ruby, Java, C#, Smalltalk, etc



=end

# Dynamic Dispatch Versus Closures

=begin
The OOP trade-off

Any method that makes calls to overridable methods can have its
behavior changed in subclasses even if it is not overriden
    - maybe on purpose, maybe by mistake
    - observable behavior includes calls-to-overridable methods

So harder to reason about "The code you're looking at"
    - Can avoid by disallowing overriding
        - private or final methods

so easier for subclasses to affect behavior without copying code
    - Provided method in superclass is not modified later




=end