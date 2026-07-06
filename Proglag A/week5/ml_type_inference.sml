(* how does ml decides the type inference
1. Determine types of bindings in order
2. For each val or fun binding
3. Afterward, use type variables for any unconstrained types
4. Finally, enfore the value restriction

 *)

val x = 42 (* val x : int *)

fun f (y, z, w) =
    if y (* y must be bool *)
    then z + x (* z must be int *)
    else 0 (* both branches have same type *)

(* f must return an int
f must take a bool * int * anything
so val f : bool * int * 'a -> int

*)	     
	     
(*
f: T1 -> T2 [must be a function; all function take 1 arg]
x: T1 

y :T3
z: T4

T1 = T3 * T4 [else pattern match does not type-check]
T3 = int [abs has type int -> int]
T4 = int [becase we added z to an int]

SO T1 = int * int
so (abs y) + z : int, so let-expression : int, so body : int
T2 : int

f: int * int -> int

*)

fun f x =
    let val (y,z) = x in
	(abs y) + z
    end
(*
Sum: t1->t2
xs : t1

x : t3

xs': t3 list

t1 = t3 list
t2 = int [because 0 might be returend]
t3 = int [because x:t3 and we add x to something]
from t1=t3 list and t3 = int, we know t3 = int list
from that and t2 = int, we know f : int list -> int

*)

	
	
fun sum xs =
    case xs of
	[] => 0
     | x :: xs' => x + sum(xs') 

	
