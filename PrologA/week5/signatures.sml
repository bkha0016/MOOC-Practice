(* a singature is a type for a module
- What bindings does it have and what are their types

Can define a signature and ascribe it to modules - example

 *)

signature MATHLIB =
sig
    val fact : int -> int
    val half_pi : int
    val doubler : int -> int
end

structure MyMathLib :> MATHLIB =
struct
fun fact x =
    if x = 0
    then 1
    else x * fact (x-1)
		  
val half_pi = Math.pi / 2
fun doubler x = x * 2
val eight = doubler 4

			
end

val pi = MyMathLib.half_pi + MyMathLib.half_pi
(* val twenty_eight = MyMathLib.doubler 14
if theres no signature for that fn in mymathlib, then its not possible 
for them to be used even though theres a module for it *)


				 
