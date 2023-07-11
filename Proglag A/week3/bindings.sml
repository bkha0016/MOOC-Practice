(*
datatype mytype = TwoInts of int * int
	 	  | Str of string
		  | Pizza

adds new type mytype to the environment
adds constructors to the environment: TwoInts, Str, and Pizza

A constructor is (among other things), a function that makes
values of the new type (or is a value of the new type)
- TwoInts : int * int -> mytype
- Str: string -> mytype
- Pizza : mytype		  

*)

datatype mytype = TwoInts of int * int
		| Str of string
	| Pizza

val a = Str "hi"
val b = Str
val c = Pizza
val d = TwoInts(1+2, 3+4)
val e = a
	    
	  
	     
	     

