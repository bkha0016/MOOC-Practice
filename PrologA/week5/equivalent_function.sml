(* more careful look at what "two pieces of code are equivalent" means
- Fundamental software-engineering idea

- Made easier with; Abstraction (hiding things), fewer side effects

not about any "new ways to code something up"

Given eq arguments, they:
- Produce eq results
- Have the same (non-) termination behavior
- Mutate (non-local) memory in the same way
- Do the same input/output
- Raise the same exceptions

Notice it is much easier to be eq if :
- ther are fewer possible arguments
- we avoid side-effects: mutation, input/output, and exceptions

 *)

(*These two functions are equivalent*)

fun f x = x + x

val y = 2
fun f x =  y * x

(*These two functions are not equivalent
the fun g allows mutation => great reason for "pure" functional programming
*)
fun g (f,x) = (f x) + (f x)

val y = 2
fun g (f,x) = y * (f x)


fun f x =
    let
	val y = g x
	val z = h x
    in
	(y,z)
    end

fun f x =
    let
	val z = h x
	val y = g x
    in
	(y,z)
    end
	
