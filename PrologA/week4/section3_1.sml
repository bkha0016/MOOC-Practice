(*Silly examples including higher order fn*)

val x = 1 (*irrelevant*)
fun f y =
    let
	val x = y + 1
    in
	fn z => x + y + z
    end
val x = 3 (*irrelevant*)
val g = f 4 (*adding 9 to the argument*)
val y = 5
val z = g 6 (*6 + 9 = 15*)

fun f g =
    let
	val x = 3
    in
	g 2
    end

val x = 4 (*irrelvant*)
fun h y = x + y (*adding 4 to the argument*)
val z = f h 
	  
(*Passing closures to iterators like filter*)
fun filter (f,xs) =
    case xs of
	[] => []
      | x :: xs' => if f x then x :: filter(f, xs') else filter(f, xs')

fun allGreaterThanSeven xs = filter (fn x => x > 7, xs)
fun allGreaterThan (xs, n) = filter (fn x => x > n, xs)
				    
	  
(*reducing computational time*)	  

fun allShorterThan1 (xs, s) = filter (fn x => String.size x < String.size s, xs)
fun allShorterThan2 (xs,s) =
    let
	val i = String.size s
    in
	filter (fn x => String.size x < i, xs)
    end

(*Fold and more closure examples*)
fun fold (f, acc, xs) =
    case xs of
	[] => acc
      | x :: xs' => fold(f, f(acc,x), xs')

			

(*to sum elements in a list foo
fold((fn(x,y) => x + y), 0, [1,2,3])
 *)
			
fun numberInRange (xs, lo, hi) =
    fold (fn(x,y) => x + (if y >= lo andalso y <= hi then 1 else 0), 0, xs)

fun areAllShorter (xs,s) =
    let
	val i = String.size s
    in
	fold(fn(x,y) => x andalso String.size y < i, true, xs)
    end

(*Another closure idiom: Combining functions*)
	
fun compose (f,g) = fn x => f (g x)
			      
fun sqrt_of_abs i = Math.sqrt(Real.fromInt (abs i))
fun sqrt_of_abs1 i = (Math.sqrt o Real.fromInt o abs) i
fun sqrt_of_abs2 i = Math.sqrt o Real.fromInt o abs
						    
fun sqrt_of_abs3 i = i |> abs |> Real.fromInt |> Math.sqrt
    		       
(* Another Closure Idiom: Currying & Partial Application *)		    

		       
