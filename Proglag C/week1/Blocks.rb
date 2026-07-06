=begin 

Blocks
    Blocks are probably Ruby's strangest feature compared to other PLs
    But almost just closures
        - Normal: easy way to pass anonymous functions to methods for all the usual reasons
        - Normal: Blocks can take 0 or more arguments
        - Normal: Blocks use lexical scope: block body uses environment where block was defined

Some strange things
    Can pass 0 or 1 block with any message
        - Callee might ignore it
        - Callee might give an error if you do not send one
        - Callee might do different things if you do/don't send one
            - Also number-of-block-arguments can matter
    Just put the block "next to" the "other" arguemtns (if any)
            - Syntax: {e}, {|x| e}, {|x, y| e}, etc
                Can also replace { and } with do and end
                    - often preferred for blocks > 1 line

Blocks Everywhere
    Rampant use of great block-taking methods in standard library
    Ruby has loops but very rarely used
            - Can write (0..i).each { |j| e}, but often better options
    Examples (consult documentation for manyy more)



=end

a = Array.new(5) {|i| 4 * (i+1)}
a.each {puts "hi"}
a.each {|x| puts (x * 2)}
a.map {|x| x * 2} # transorming each items in the list using x * 2
a.any? {|x| x > 7}
a.all? {|x| x > 7}
a.inject(0) {|acc, elt| acc + elt}
a.select {|x| x > 7} #non-synonym: filter


=begin 
Using blocks:

More strangeness
    Callee does not give a name to the (potential) block argument
    Instead just calls it with yield or yield (args)
    - example:
                def silly a
                    (yield a) + (yield 43)
                end

    x.silly(5) {|b| b * 2}


=end

class Foo
    def initialize(max)
        @max = max
    end

    def silly
        yield(4,5) + yield(@max, @max)
    end

    def count base
        if base > @max
            raise "reached max"
        elsif yield base
            1
        else
            1 + (count(base + 1) {|i| yield i})
        end
    end
end







