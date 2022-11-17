(* Another Closure Idiom: Combining Functons *)

fun compose (f,g) = fn x => f(g x)

(* ('b -> 'c) * ('a -> 'b) -> ('a -> 'c)  *)

(* int -> real*)
fun sqrt_of_abs i = Math.sqrt (Real.fromInt (abs i))

fun sqrt_of_abs i = (Math.sqrt 			      
