datatype mytype = TwoInts of int * int
		| Str of string
       | Pizza

(*mytype -> int*)	     
	     
fun f (x: mytype) =
    case x of
	Pizza => 3
      | Str s  => 8
      | TwoInts(i1,i2) => i1 + i2

				  (*| Pizza => 4; redudant case; error*)
				  (*fun g x = case x of Pizza => 3; missing cases: warning*)
				   
(*
In general the syntax is:
case e0 of 
     p1 => e1
    |p2  => e2
    |pn  => en 


*)
		
(*Enumerations: including carrying other data*)
datatype suit = Club | Diamond | Heart | Spade
datatype rank = Jack | Queen | King | Ace | Num of int

(*Alternate ways of identifying real-world things/people



*)				
datatype id = StudentNum of int | Name of string * (string option) * string

(*
bad training & languages make one of types incovenient lead to common bad styles
where each of types are used where one of types are the right tool

{student_num : int,
first : string,
middle : string option,
last : string
}
a better way:

{student_num : int option,
first : string,
middle : string option,
last : string

}

Expression trees: a more exciting datatype, using self-reference
*)									 
				

datatype exp = Constant of int
	     | Negate of exp
	     | Add of exp * exp
	     | Multiply of exp * exp

				     
fun eval e =
    case e of
	Constant i => i
      | Negate e2 => ~ (eval e2)
      | Add(e1,e2) => (eval e1) + (eval e2)
      | Multiply(e1,e2) => (eval e1) * (eval e2)

fun number_of_adds e = (* exp -> int *)
    case e of
	Constant i => 0
      | Negate e2 => number_of_adds e2
      | Add(e1, e2) => 1 + number_of_adds e1 + number_of_add e2
      | Multiply(e1,e2) => number_of_adds e1 + number_of_adds e2
							      

val example_exp : exp = Add (Constant 19, Negate (Constant 4))

val example_ans : int = eval example_exp

val example_addcount = number_of_adds (Multiply(example_exp, example_exp))
			     
					   
(*Note: example as explained in video assumes there is no library 
for max of two ints. There is : Int.max*)

fun max_constant e =
    let fun max_of_two(e1,e2) =
	    Int.max(max_constant e1, max_constant e2)
    in	
    case e of
	Constant i => i
      | Negate e2 => max_constant e2
      | Add(e1,e2) => max_of_two(e1,e2)
      | Multiply(e1,e2) => max_of_two(e1,e2)
    end
			  
    






val test_exp = Add (Constant 19, Negate (Constant 4))
val nineteen = max_constant test_exp		   
									   
									   
