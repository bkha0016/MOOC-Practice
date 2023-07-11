(*
length: t1 -> t2
xs : t1

x : t3
xs' : t3 list

t1 = t3 list
t2 = int

t3 list -> int
'a list -> int


*)

fun length xs =
    case xs of
	[] => 0
     | x :: xs' => 1 + length xs' 

(*
f : t1 * t2 * t3 -> t4
x:t1
y:t2
z:t3

t4 = t1 * t2 * t3
t4 = t2 * t1 * t3
only way those can both be true is if t1 = t2
put it all together: f : t1 * t1 * t3 -> t1 * t1 * t3
'a * 'a * 'b -> 'a * 'a * 'b


*)

			      
fun f (x,y,z) =
    if true
    then (x,y,z)
    else (y,x,z)

(*
compose : t1 * t2 -> t3

f : t1
g : t2
x : t4

body being a fn has type t3 =t4 -> t5
from g being passed x, t2 = t4 -> t6 for some t6
from f being passed the result of g, t1 = t6 -> t7 for some t7
from call to f being body of anoymous fn

put it all together : t1 = t6 -> t5, t2 = t4 -> t6, t3=t4 -> t5
(t6 -> t5) * (t4 -> t6) -> (t4->t5)

('a -> 'b) * ('c -> 'a) -> ('c -> 'b)

*)
fun compose (f,g) = fn x => f (g x)	     
