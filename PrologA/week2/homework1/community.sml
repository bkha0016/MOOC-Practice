fun alternate_helper (number : int list, sign : bool) : int =
    if null number
    then 0
    else if sign = true then (hd number) + alternate_helper(tl number, false)
    else
	alternate_helper(tl number, true) - (hd number)

fun alternate (number : int list) : int =
    alternate_helper(number, true)


fun max (number : int list) =
    if null number
    then hd number
    else
	let
	    val rest = max(tl number)
	in
	    if (hd (tl number)) > hd number
	    then rest
	    else hd number
	end

fun cumsum_helper (number : int list, num1 : int) : int list =
    if null number
    then []
    else hd number + num1 :: cumsum_helper(tl number, hd number)

					  
fun cumsum (number : int list) : int list =
    cumsum_helper(number, 0)
		 

	    
			     
		   

		    

		     
		
		
    
