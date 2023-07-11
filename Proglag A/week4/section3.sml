(*
(*Taking functions as arguments

the most common use of first-class functions is passing them as arguments
to other functions, so we motivate this use first

Example of a fn that takes another fn
 *)

fun n_times (f,n,x) =
    if n = 0
    then x
    else f(n_times(f,n-1,x))

fun double x = x + x

val x1 = n_times(double, 4, 7) (*112*)

fun increment x = x + 1

val x2 = n_times(increment, 4, 7) (*11*)

val x3 = n_times(tl, 2,[4,8,12,16]) (*[12,16]*)		

fun triple x = 3 * x
fun triple_n_times (n,x) = n_times(triple, n, x)

				  
(*
Polymorphic types & fn as arguments

lets fn take arguments of any type. its a separate issue from first-class fn

there are fn that take fn and do not have polymorphic types
there are fn with polymorphic types that do not take fn

*)	
fun times_until_zero (f,x) =
    if x = 0 then 0 else 1 + times_until_zero(f, f x)

val x4 = times_until_zero(double, 3)					     

(*
Anonymous functions
=> there is no reason that a fn like triple that is passed to another fn like n_times
needs to be defined at top-level. As usual,its better to define such fn locally if they
are needed only locally so we could write:

*)


fun triple_n_times (n,x) =
    let fun triple x = 3 * x in n_times(triple,n,x) end

fun triple_n_times (n,x) = n_times((let fun triple y = 3 * y in triple end), n , x)

(*best version to do*)
fun triple_n_times (n,x) = n_times((fn y => 3 *y),n,x)

(*
fun increment x = x + 1
val increment = fn x => x + 1
*)

(*				  
fun nth_tail_poor (n,x) = n_times((fn y => tl y), n, x)

just do this is way better

fun nth_tail_poor (n,x) = n_times(tl, n,x)

*)

(*
Maps & filters
we now consider a very useful higher-order fn over lists:
*)				  
fun map (f,xs) =
    case xs of
	[] => []
      | x :: xs' => (f x) :: (map(f, xs'))

(*
val x1 = map (increment, [4,8,12,16]) => [5,9,13,17]
map (hd, [[1,2],[3,4],[5,6,7]]) => [1,3,5]
*)

fun filter (f,xs) =
    case xs of
	[] => []
      | x :: xs' => if f x
		    then x :: (filter (f, xs'))
		    else filter (f, xs')

(*
filter((fn (_,v) => v mod 2 = 0), xs)

*)				
				
(*
Returning functions: fn can also return fn

*)
fun double_or_triple f =
    if f 7
    then fn x => 2 * x
    else
	fn x => 3 * x

(*Not just for numbers and lists*)

datatype exp = Constant of int | Negate of exp | Add of exp * exp | Multiply of exp * exp
											  
fun is_even v = (v mod 2 = 0)

fun true_of_all_constants (f,e) =
    case e of
	Constant i => f i
      | Negate e1 => true_of_all_constants(f,e1)
      | Add(e1,e2) => true_of_all_constants(f,e1) andalso true_of_all_constants(f,e2)
      | Multiply(e1,e2) =>  true_of_all_constants(f,e1) andalso  true_of_all_constants(f,e2)
										      
				  
fun all_even e =  true_of_all_constants(is_even, e)
*)
(*Silly examples including hihger-order fn*)


val x = 1 (*irrelevant*)
fun f y =
    let
	val x = y + 1
    in
	fn z => x + y + z
    end

val x = 3 (*irrelevant*)
val g = f 4 (*add 9 to the argumnet*)
val y = 5 (*add 11 to the argiment*)
val z = g 6 (*9 + 6 = 15*)	    

				       
				       

				       
