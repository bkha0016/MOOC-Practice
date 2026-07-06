=begin 

Subtyping is a concept in programming languages that defines relationships 
between types, specifically how one type can be considered a subtype of another. Subtyping 
typically involves an "is-a" relationship, 
where a subtype is a specialization or a more specific version of its supertype.

In the context of Ruby, subtyping is primarily achieved through class inheritance and module inclusion, 
allowing one class or module to be considered a subtype of another. 
Let's explore some examples in Ruby to illustrate subtyping:


=end

class Animal
    def speak
      "I'm an animal"
    end
  end
  
  class Dog < Animal
    def speak
      "Woof!"
    end
  end
  
  class Cat < Animal
    def speak
      "Meow!"
    end
  end
  
  dog = Dog.new
  cat = Cat.new
  
  puts dog.speak  # Output: "Woof!"
  puts cat.speak  # Output: "Meow!"

  module Shape
    def area
      raise NotImplementedError, "Subtypes must implement the 'area' method"
    end
  end
  
  class Circle
    include Shape
  
    def area(radius)
      Math::PI * radius**2
    end
  end
  
  class Rectangle
    include Shape
  
    def area(length, width)
      length * width
    end
  end
  
  circle = Circle.new
  rectangle = Rectangle.new
  
  puts circle.area(3)       # Output: 28.274333882308138
  puts rectangle.area(4, 5) # Output: 20
  
  
