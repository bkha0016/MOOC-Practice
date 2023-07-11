(*syntatic sugar
using or not using syntatic sugar is always equivalent
- By definition, else not syntatic sugar
*)

fun f x = x andalso g x
fun f x = if x then g x else false
				 
(* Standard equivalences 
three general equivalences that always work for functions
- In any decent language

1. Consistenly rename bound variables and uses
 *)

val y = 14
fun f x = x + y + x

val y = 14
fun f z = z + y + z

(*2. Use a helper function or do not*)
val y = 14
fun g z = (z + y + z) + z

val y = 14
fun f x = x + y + x
fun g z = (f z) + z

(*3. Unnecessary function wrapping*)
fun f x = x + x
fun g y = f y

fun f x = x + x
val g = f
	    
		     
		      
