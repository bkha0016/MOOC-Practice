=begin 


Ruby is fully committed to OOP:
        Every value is a reference to an object
    Simpler, smaller semantics
    Can call methods on anything
        May just get a dynamic "undefined method" error
    Almost everything is a method call

All code is methods
    All methods you define are part of a class
    Top-level methods (in file or REPL) just added to Object class
    Subclassing discussion coming later, but:
        - Since all classes you define are subclasses of Object, all
            inherit the top-level methods
        - You can call tehse methods anywhere in the program
        - Unless a class overrides (roughly-not-exactly, shadows) it by
            defining a method wiht the same name

Reflection and Expolatory programming
    - All objects also have methods like methods & class
    - Can use at run-time to query "what an object can do" and respond accordingly
        - called reflection

    - Also useful in the REPL to explore what methods are available
        - may be quicker than consulting full documentation
    - Another example of  "just objects and methods calls"


=end