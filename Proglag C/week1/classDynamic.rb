=begin 


Changing Classes
    Ruby programs (or REPL) can add/change/replace methods while a
    program is running

    breaks abstractions and makes programs very difficult to analyze
    , but it does have plausible uses
    
    Helps re-enforce "the rules of OOP"
        - Every object has a class
        - A class determines its instances' behavior



Meaning of class definitions are dynamic:

- Adding methods: adding new methods to an existing class even after it has been defined
- Modifying existing methods: redefine existing methods of a class dynamically
- Including modules: ruby supports mixin-based composition through modules


=end

# Examples of a mixin

module MyModule
    def module_method
        puts "This is a module method."
    end
end

class MyClass
    def existing_method
        puts "This is an existing method"
    end
end

obj = MyClass.new
obj.module_method # Error: NoMethodError

class MyClass
    include MyModule
end


obj.module_method # Outputs: This is a module method




