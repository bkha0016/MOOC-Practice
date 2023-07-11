(* 
with closures, this means we can avoid repeating computations that do not depend on fn argument      

- not so worried about performance, but good example to emphasize the semantics of the fn

*)

fun filter (f,xs) =
    case xs of
	[] => []
      | x :: xs' => if f x then x :: filter(f,xs') else filter(f,xs')

fun allShorterThan1 (xs,s) = (* string list * string -> string list    *)
    filter (fn x => String.size x < String.size s, xs)

fun allShorterThan2 (xs,s) =
    let
	val i = String.size s
    in
	filter(fn x => String.size x < i, xs)
    end
	
