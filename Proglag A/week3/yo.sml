(*append two list using case of*)

fun append (xs,ys) =
    case xs of
	[] => ys
      | x :: xs' => x :: append(xs',ys)

(*count the amt of item in the list*)			       
fun count_list (xs) =
    case xs of
	[] => 0
      | x :: xs' => 1 + count_list(xs')

(*zip items: 2 items yo
[(1,2), (3,4)] => ([1,3], [2,4])

*)

exception Nothing		      
		      
fun zip2 (xs) =
     case xs of
	 ([],[]) => [] 
	|(hd1 :: tl1, hd2 :: tl2) => (hd1, hd2) :: (zip2(tl1,tl2))
	| _ => raise Nothing

(*unzip items: 2 items only



*)		     
    
fun unzip2 (xs) =
    case xs of
	[] => ([],[])
      | (a,b) :: tl => let val (l1,l2) = unzip2(tl)
		       in
			   (a :: l1, b :: l2)
		       end
      | _ => raise Nothing 			   
	
(*
Create a dezip2
([1,2],[3,4]) => [(1,3),(2,4)]
*)			       

fun dezip2 (xs) =
    case xs of
	([], []) => []
       |(hd1 :: tl1, hd2 :: tl2)  => (hd1, hd2) :: dezip2(tl1,tl2)
       | _ => raise Nothing
 		    
	
	 
