(*Pattern matching of each types*)

(*poor style to have one-brach cases*)
fun sum_triple1 triple =
    case triple of
	(x,y,z) => x + y + z
fun full_name1 r =
    case r of
	{first = x, middle = y, last = z} => x ^ " " ^ y ^ " " ^ z
								     
(*This is okay style, semantically identical to one-branch case exp*)
fun sum_triple2 triple =
    let val (x,y,z) = triple
    in
	x + y + z
    end

fun full_name2 r =
    let val {first = x, middle = y, last = z} = r
    in
	x ^ " " ^ y ^ " " ^ z
    end

(*function argument patterns: match agaist the argument in a function call*)
fun sum_triple3 (x,y,z) =
    x + y + z
		
fun full_name3 {first = x, middle = y, last = z} =
    x ^ " " ^ y " " ^ z
			  
(*The truth about functions
every function takes one argument
what we call multi-argumet fn are just fn taking one tuple arguemnt, impleneted with a
tuple pattern i the fn bindings - Elegant & flexible language design

Enables cute & useful things you cannot do in Java*)

fun rotate_left (x,y,z) = (y,z,x)
fun rotate_right t = rotate_left(rotate_left t)			      
