(*
But first-class fn are useful anywhere for any kind of data
- can pass several fn as arguments
- can put fn in data struct
- can return fn as results
- can write higher-order fn that traverse your own data struct

useful whenever you want to abstract over "what to compute with"
- no new lang features

*)

(*returning a fn*)


fun double_or_triple f = (* (int->bool) -> (int -> int)    *)
    if f 7
    then fn x => 2 * x
    else
	fn x => 3 * x

val double = double_or_triple (fn x => x -3 = 4) (*this would return a fn*)
val nine = double_or_triple (fn x => x = 42) 3	(*this would return a fn*)		      
(*
But the REPL prints (int -> bool) -> int -> int
because it never prints unnecessary parentheses and
t1 -> t2 -> t3 -> t4 means t1 -> (t2 -> (t3 -> t4))
*)


(*Higher order functions over our own datatype bindings*)
datatype exp = Constant of int
	     | Negate of exp
	     | Add of exp * exp
	     | Multiply of exp * exp
(*given an exp, is every constant in it an even number*)

fun true_of_all_constants (f,e) =
    case e of
	Constant i => f i
      | Negate e1  => true_of_all_constants(f,e1)
      | Add(e1,e2) => true_of_all_constants(f,e1) andalso true_of_all_constants(f,e2)
      | Multiply(e1,e2) => true_of_all_constants(f,e1) andalso true_of_all_constants(f,e2)
										    
fun all_even (e) = true_of_all_constants(fn x => x mod 2 = 0, e)
    
			    
