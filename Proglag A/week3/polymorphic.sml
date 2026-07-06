(*
Claimed built in options and lists are not needed/special
- Other than special syntax for list constructors

But these datatype binings are polymorphic type constructors
- int list and string list and int list list are all types, not list
- functions might or might not be polymorphic
val sum_list : int list -> int
val append : 'a list * 'a list -> 'a list

good language design: can define new polymorphic datatypes


*)

datatype 'a option = NONE | SOME of 'a
datatype 'a mylist = Empty | Cons of 'a * 'a mylist
datatype ('a,'b') tree = Node of 'a * ('a,'b) tree * ('a,'b) tree | Leaf of 'b

										
(*
Can use these type variables in constructor definitions

Binding then introduces a type constructor, not a type
Must say int mylist or string mylist or 'a mylist
not "plain" mylist

*)					
			    
fun sum_tree tr =
    case tr of
	Leaf i => i
      | Node(i, lft, rgt) => i + sum_tree lft + sum_tree rgt

fun sum_leaves tr =
    case tr of
	Leaf i => i
      | Node(i, lft, rgt) => sum_leaves lft + sum_leaves rgt

fun num_leaves tr =
    case tr of
	Leaf i => 1
      | Node(i, lft, rgt) => num_leaves lft + num_leaves rgt

							 
