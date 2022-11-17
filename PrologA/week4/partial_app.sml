(* partial application  *)

fun sorted3 x y z = z >= y andalso y >= x

fun fold f acc xs  =
    case xs of
	[] => acc
      | x :: xs' => fold f (f(acc,x)) xs'

val is_nonnegative = sorted3 0 0
val sum = fold (fn (x,y) => x + y) 0

fun is_nonnegative_inferior x = sorted3 0 0 x
fun sum_inferior xs = fold (fn (x,y) => x + y) 0 xs					


(* another example *)

fun range i j = if i > j then [] else i :: range (i+1) j
(* range 3 6 [3,4,5,6]  *)
						 
val countup = range 1
(* countup 6 [1,2,3,4,5,6] *)
		    
fun countup_inferior x = range 1 x

fun exists predicate xs =
    case xs of
	[] => false
     |  x::xs' => predicate x orelse exists predicate xs'

val no = exists (fn x => x = 7) [4,11,23] (* false*)

val hasZero = exists (fn x => x = 0) (* int list -> bool *)

val incrementAll = List.map (fn x => x + 1) (* int list -> int list*)		     
