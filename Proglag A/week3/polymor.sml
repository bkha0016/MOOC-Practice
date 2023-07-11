(*Defining polymorphic datatypes*)

datatype 'a option = NONE | SOME of 'a
datatype 'a mylist = Empty | Cons of 'a * 'a mylist
datatype ('a,'b) tree =
	 Node of 'a * ('a,'b) tree * ('a,b') tree | Leaf of 'b
								
