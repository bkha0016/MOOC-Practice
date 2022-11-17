(* Dan Grossman, Coursera PL, HW2 Provided Code *)

(* if you use this function to compare two strings (returns true if the same
   string), then you avoid several of the functions in problem 1 having
   polymorphic types that may be confusing *)
fun same_string(s1 : string, s2 : string) =
    s1 = s2

(* put your solutions for problem 1 here *)

fun all_except_option (a,xs) = (* string * string list -> SOME/NONE *)
    case xs of
	[] => NONE
      | x :: xs' =>
	let
	    val rest = all_except_option(a, xs')
	    val same = same_string(a,x)
	in
	    case rest of
		NONE => if same then SOME(xs') else NONE
	      | SOME y => if same then rest else SOME(x::y)
	end
	    
fun get_substitutions1 (xs, s) =
    case xs of
	[] => []
      | x :: xs' =>
	case all_except_option(s,x) of
	    NONE => get_substitutions1(xs', s)
	  | SOME y => y @ get_substitutions1(xs', s)

fun get_substituions2 (xs,s) =
    let
	fun aux(xs, s, acc) =
	    case xs of
		[] => acc
	      | x :: xs' =>
		case all_except_option(s,x) of
		    NONE => aux(xs', s, acc)
		  | SOME y => aux(xs, s, acc @ y)
    in
	aux(xs, s, [])
    end

fun similar_names (xs : string list list, fullname : {first:string, last:string, middle:string}) : {first:string, last:string, middle:string} list =

    let
	val {first = x, last = y, middle = z} = fullname
	fun helper([]) = []
	  | helper(hd :: tl)  = {first = hd, last = y, middle = z} :: helper(tl)
    in
	fullname :: helper(get_substitutions1(xs,x))
    end

		    

(* you may assume that Num is always used with values 2, 3, ..., 10
   though it will not really come up *)
datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int 
type card = suit * rank

datatype color = Red | Black
datatype move = Discard of card | Draw 

exception IllegalMove

(* put your solutions for problem 2 here *)
fun card_color (c : card) : color =
    case c of
	(Spades,_) => Black
      | (Clubs,_) => Black
      | (Diamonds,_) => Red
      | (Hearts,_) => Red

fun card_value (c : card) : int =
    case c of
	(_, Num i) => i
      | (_, Ace) => 11
      | (_,_) => 10


(*remove only the first one*)		     
fun remove_card (cs : card list, c : card, e : exn) : card list =
    case cs of
	[] => raise e
      | x :: xs' => if x = c
		    then xs'
		    else
			x :: remove_card (xs', c, e)
       
fun all_same_color (cs : card list) : bool =
    case cs of
	[] => true
      | head :: [] => true   
      | head :: (neck::rest) => if card_color head = card_color neck andalso all_same_color(neck::rest)
				then
				    true
				else
				    false
fun sum_cards (cs : card list) : int =
    let fun aux(cs, acc) =
	    case cs of
		[] => acc
	      | c :: cs' => aux(cs', acc + card_value c)
    in
	aux(cs, 0)
    end
fun score (cs : card list, goal : int) : int =
    let
	val sum = sum_cards cs
	val comp = if sum > goal
		   then
		       3 * (sum - goal)
		   else
		       (goal - sum)
    in
	if all_same_color cs
	then
	    comp div 2
	else
	    comp
    end

fun officiate (cs : card list, ms : move list, goal : int) =
    let
	fun game (curr_card, card_left, play_left) =
	    case play_left of
		[] => score(curr_card, goal)
	      | (Discard c) :: tail => game(remove_card(curr_card,c,IllegalMove),card_left, tail)
	      | Draw :: tail =>
		case card_left of
		    [] => score(curr_card, goal)
		  | c :: rest => if sum_cards (c :: curr_card) > goal
				 then
				     score(c :: curr_card, goal)
				 else
				     game(c :: curr_card, rest, tail)
    in
	game ([], cs, ms)
    end
	
    
	
	       
			
	
	      
