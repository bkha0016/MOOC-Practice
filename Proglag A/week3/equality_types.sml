
(* 'a list * a' list -> 'a list *)

fun append (xs, ys) =
    case xs of
	[] => ys
      | x::xs'  => x :: append(xs', ys)

val ok1 = append(["hi", "bye"], ["programming", "languages"])
val ok2 = append([1,2],[4,5])

(*val not_ok = append([1,2], ["programming", "language"])*)
(*
The more general rule 
Easy rule you (and the type-checker) can apply w.o thinking:
a type t1 is more general than the type t2 if you can take t1,
replace its type variables consistenly, and get t2

replace each 'a with int * int
replace each 'a with bool & each 'b with bool
replace each 'a with bool & each 'b with int
replace each 'b with 'a & each 'a with 'a


example, given
type foo = int * int

the type
{quux : 'b, bar: int * 'a, baz : 'b}
is more general than
{quux: string, bar : foo, baz : string}
which is eq to
{bar : int * int, baz: string, quux : string}


You might also see type variables with a second quote
''a list * ''a -> bool

These are "eq types" that arise from using the = operator
- the = operator works on lots of types: int, string, tuples, containing all eq types
- But not all types: fn types, real, ...

The rules for more general are exactly the same except you have to replace an eq types
var with a type that can be used with =
- A 'strange' feature of ML because = is special

*)

(* ""a * ""a -> string *)
 fun same_thing (x,y) =
     if x = y then "yes" else "no"
(* int -> string *)
 fun is_three x =
     if x = 3 then "yes" else "no"
		
