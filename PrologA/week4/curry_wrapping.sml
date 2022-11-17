(* curry wrapping *)

fun curry f x y = f (x,y)
fun uncurry f (x,y) = f x y

fun other_curry f x y = f y x			


(* tupled but we wish it were curried *)
fun range (i,j) = if i > j then [] else i :: range(i+1, j)

val countup = curry range 1

val xs = countup 7		    
