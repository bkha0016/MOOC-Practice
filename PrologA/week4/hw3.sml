(* Coursera Programming Languages, Homework 3, Provided Code *)

exception NoAnswer

datatype pattern = Wildcard
		 | Variable of string
		 | UnitP
		 | ConstP of int
		 | TupleP of pattern list
		 | ConstructorP of string * pattern

datatype valu = Const of int
	      | Unit
	      | Tuple of valu list
	      | Constructor of string * valu

fun g f1 f2 p =
    let 
	val r = g f1 f2 
    in
	case p of
	    Wildcard          => f1 ()
	  | Variable x        => f2 x
	  | TupleP ps         => List.foldl (fn (p,i) => (r p) + i) 0 ps
	  | ConstructorP(_,p) => r p
	  | _                 => 0
    end

(**** for the challenge problem only ****)

datatype typ = Anything
	     | UnitT
	     | IntT
	     | TupleT of typ list
	     | Datatype of string

(**** you can put all your code here ****)

fun only_capitals xs : string list =
    List.filter(fn s => Char.isUpper(String.sub(s,0))) xs
	       
val longest_string1 =
    List.foldl (fn (x,y) => if String.size x > String.size y then x else y) ""

val longest_string2 =
    List.foldl (fn (x,y) => if String.size x >= String.size y then x else y) ""

(*helper fn*)	       
fun longest_string_helper f =
    List.foldl
	(fn (x,y) => if f(String.size x, String.size y) then x else y) ""

val longest_string3 =
    longest_string_helper(fn(x,y) => x > y)
			 
val longest_string4 =
    longest_string_helper(fn(x,y) => x >= y)

val longest_capitalized = longest_string1 o only_capitals			

val rev_string = String.implode o List.rev o String.explode						
fun first_answer f xs =
    case xs of
	[] => raise NoAnswer
      | x :: xs' => case f x of
			NONE => first_answer f xs'
		      | SOME v => v

fun all_answers f x =
    let
	fun aux([],[]) = NONE
	  | aux ([], acc) = SOME acc
	  | aux (x::xs', acc) = case f x of
				    NONE => aux(xs',acc)
				  | SOME v => aux(xs', v @ acc)
    in
	case x of
	    [] => SOME []
	  | _ => aux(x,[])
    end

val count_wildcards = g (fn x => 1) (fn x => 0)

val count_wild_and_variable_lengths = g (fn x => 1) String.size

fun count_some_var(s:string, p:pattern) : int =
    g (fn x => 0) (fn x => if x = s then 1 else 0) p

fun check_pat (p:pattern) : bool =
    let
	fun get_var_string(p:pattern) : string list =
	    case p of
		Wildcard => []
	      | Variable str => [str]
	      | UnitP  => []
	      | ConstP i => []
	      | TupleP plist =>
		List.foldl (fn (p,xs) => get_var_string p @ xs) [] plist
	      | ConstructorP (str,pat) => get_var_string pat

	fun check_string_reps([]:string list) : bool = false
	  | check_string_reps(s :: rest)  = List.exists (fn x => s = x) rest
    in
	not(check_string_reps(get_var_string p))
    end

fun match (v : valu, p:pattern) =
    case (v,p) of
	(_,Wildcard) => SOME []
      | (_, Variable str) => SOME [(str,v)]
      | (Unit, UnitP) => SOME []
      | (Const i, ConstP j) => if i = j then SOME [] else NONE
      | (Tuple vlist, TupleP plist) =>
	if List.length vlist = List.length plist
	then
	    all_answers match(ListPair.zip(vlist,plist))
	else
	    NONE
      | (Constructor(s1,v), ConstructorP(s2,p)) =>
	if s1 = s2
	then
	match(v,p)
	else
	    NONE
      | (_,_) => NONE

fun first_match(v: valu)(ps: pattern list) =
    SOME (first_answer (fn p => match(v,p)) ps) handle NoAnswer => NONE
			    
					 
					 
	
	
			      
				      
					     
