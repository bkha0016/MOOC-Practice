=begin


Ruby why though?
- Pure object-oriented: all values are objects (even numbers)
- class-based: every object has a class that determines behavior
    - like java, unlike JS
    - Mixins (neither Java interfaces nor C++ multiple inheritance)
- Popular for regex, server-side web, string manipulation


=end

class Hello

    def my_first_method
        puts "Hello, World!"
    end
end

x = Hello.new #create instance of the hello object
x.my_first_method
