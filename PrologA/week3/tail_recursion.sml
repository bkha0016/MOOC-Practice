(* Tail Recursion *)

(*
Call stacks

While a program runs, there is a call stack of function calls that
have started but not yet returned

- calling a function f pushes an instance of f on the stack
- when a call to f finsihes, its popped from the stack

These stack-frames store information like the value of local variables and
"what is left to do" in the function

Due to recursion, multiple stack-frames may be calls to the same fn

*)

fun fact n = if n = 0 then 1 else n * fact(n-1)

val x = fact 3

(*Example revised

still recursive, more complicated, but the result of recursive calls
is the result for the caller (no remaining multiplication)

*)

fun fact_rev n =
    let fun aux (n, acc) =
	    if n = 0
	    then acc
	    else aux(n-1, acc * n)
    in
	aux(n,1)
    end

val y = fact_rev 3

(*
ML recognizes these tail calls in the compiler and treates them
differently:

- pop the caller before the call, allowing callee to reuse the same stack space
- (Along with optimizations) as efficient as a loop

Reasonable to assume all functional - language implementations do tail-call optimizatins


fact 3 -> aux(3,1) -> aux(2,3) -> aux(1,6) -> aux(0,6)
*)



(*
Where reasonably elegant, feasible, and important, rewriting functions to be 
tail-recursive can be much more efficient
-> tail recursive: recursive calls are tail-calls

There is a methodology that can often guide this transformation:
- create a helper fn that takes an accumulator
- Old base case becomes initial accumulator
- New base case becomes final accumulator

*)

fun sum xs =
    case xs of
	[] => 0
      | x :: xs' => x + sum(xs')

fun sum_rev xs =

    let fun aux(xs, acc) =
	    case xs of
		[] => 0
	      | x :: xs' => aux(xs', x + acc)
    in
	aux(xs, 0)
    end

fun rev xs =
    case xs of
	[] => []
      | x :: xs' => (rev xs') @ [x]


fun rev_rev xs =
    let fun aux(xs, acc) =
	    case xs of
		[] => acc
	      | x :: xs' =>  aux(xs', x :: acc)
    in
	aux(xs, [])
    end
	
(*
For fact & sum, tail-recursion is faster but both ways linear time

Non-tail recursive rev is quadratic because each recursive call uses append,
which must traverse the first list
- And 1+2+...+(length-1) is almost length*length/2
- Moral: beware list-append, especially within outer recursion

Cons constnt-time (and fast), so acc version much better


fun rev xs =
    case xs of
	[] => []
      | x :: xs' => (rev xs') @ [x]

*)	
		
fun rev_acc xs =
    let fun aux(xs, acc) =
	    case xs of
		[] => acc
	      | x :: xs' =>  aux(xs', x :: acc)
    in
	aux(xs, [])
    end
	
(*
Always tail-recursive

There are certainly cases where recursive functions cannot be evaluated in a constant
amount of space

most obvious examples are fn that process trees

In these cases, the natural recursive approach is the way to go
- You could get one recurisve call to be a tail call, but rarely worht the complication

Also beware the wrath of premature optimization
- Favor clear, concise code
- but do use less space if inputs may be large

*)	    
	    
    
 
(*
What is a tail-call?

The "nothing left for caller to do" intuition usually suffices
- If the result of f x is the "immediate result" for the enclosing fn body, then f x is a tail cal

But we can define "tail position" recursively
- Then a tail call is a fn call in tl position

*)
