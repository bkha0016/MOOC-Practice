(*f1 and f2 are always the same, no matter wher result is used*)

fun f1 y =
    let
	val x = y + 1
    in
	fn z => x + y + z
    end

fun f2 y =
    let
	val q = y + 1
    in
	fn z => q + y + z
    end
	
val x = 17 (*irrelevant*)
val a1 = (f1 7) 4
val a2 = (f2 7) 4


val x = 1

fun f y =
    let val x = y + 1
    in fn z => x + y + z end
val x = "hi"
val g = f 7
val z = g 4	  
(*  Dynamic scope tries to add a string and an unbound variabel to 6  *)

(* being able to pass closures that have free var makes higher-order fn more useful *)
	  
fun filter (f,xs) =
    case xs of
	[] => []
      | x :: xs'  => if f x then x :: filter(f,xs') else filter(f,xs')
							       
fun greaterThanX x = fn y => y > x (* int -> (int -> bool)*)
fun noNegatives xs = filter(greaterThanX ~1, xs) (*   *)
fun allGreater (xs,n) = filter (fn x => x > n, xs)
			       
			   
