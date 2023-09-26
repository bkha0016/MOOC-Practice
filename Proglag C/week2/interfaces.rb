=begin
Ruby doesn't have a built-in concept of interfaces like some other programming languages, such as Java or C#. However, Ruby provides a flexible mechanism for achieving similar goals through the use of modules and duck typing.

In Ruby:

Modules: Modules serve as a way to define sets of methods that can be included in classes. 
You can think of modules as a form of "interface" in Ruby. 
You define a module with methods 
that you expect classes to implement, 
and then classes that include the module are expected to provide implementations for those methods.


=end

module Printable
    def print
      raise NotImplementedError, "Subclasses must implement the 'print' method"
    end
  end
  
  class Document
    include Printable
  
    def print
      puts "Printing the document..."
    end
  end
  
  doc = Document.new
  doc.print

def process_printable(printable)
printable.print
end

class Document
    def print
        puts "Printing the document..."
    end
end

class Report
    def print
        puts "Printing the report..."
    end
end

doc = Document.new
report = Report.new

process_printable(doc)    # Outputs: Printing the document...
process_printable(report) # Outputs: Printing the report...
