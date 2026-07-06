=begin

Hashes like arrays but:
    - Keys can be anything: strings and symbols common
    - No natural ordering like numeric indices
    - Different syntax to make them
    Like a dynamic record with anything for field names
    - Often pass a hash rather than many arguments

Ranges like arrays of contiguous numbers but:
    - More efficiently represented, so large ranges fine

Good style to:
    - Use ranges when you can
    - Use hashes when non-numeric keys better represent data


=end

# Declare a hash table
h1 = {}

# Adding elements into the hash table
h1["a"] = "Found A"

h1[false] = "Found false"

=begin 

Similar methods
    Arrays, hashes, and ranges all have some mehtods other don't
        - Keys and values
    But also have many of the same methods, particularly iterators
        - Great for duck typing


=end

def foo A
    A.count {|x| x*x < 50}
end

foo [3,5,7,9]
foo (3..9)












