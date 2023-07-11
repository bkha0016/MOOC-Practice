(*Section 2: Exceptions *)

fun hd xs =
    case xs of
	[] => raise List.Empty
      | x :: xs' => x


exception MyUndesirableCondition

(*

carrying int * int
raise MyOtherException(3,2)

*)	      
exception MyOtherException of int * int

fun mydiv (x,y) =
    if y = 0
    then raise MyUndesirableCondition
    else x div y

fun maxlist (xs, ex) = (* int list * exn -> int *)
    case xs of
	[] => raise ex
      | x :: [] => x
      | x :: xs'  => Int.max(x, maxlist(xs',ex))


val w = maxlist ([3,4,5], MyUndesirableCondition)
val x = maxlist ([3,4,5], MyUndesirableCondition) (*5*)
	handle MyUndesirableCondition => 42

(*val y = maxlist ([], MyUndesirableCondition)*)					     
					     
val z = maxlist ([], MyUndesirableCondition) (*42*)
	handle MyUndesirableCondition => 42
					     
	
(*
Exception binding introduces a new kind of exception
*)

exception MyFirstException
exception MySecondException of int * int

(*

raise prmitive raises (aka throws) an exception
raise MyFirstException
raise (MySecondException (7,9))

a handle expression can handle an exception
- if doesnt match, exception continues to propagate

e1 handle MyFirstException => e2
e1 handle MySecondException (x,y) => e2



*)					 
					     
