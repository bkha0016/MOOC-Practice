(* Closure Idiom: Callbacks   *)

val cbs : (int -> unit) list ref = ref []

fun onKeyEvent f = cbs := f :: (!cbs)

fun onEvent i =
    let fun loop fs =
	    case fs of
		[] => ()
	      | f :: fs'  => (f i; loop fs')
    in
	loop (!cbs)
    end

(*
Clients: int -> unit

& if need to "remember" something, need mutable state

*)

val timesPressed = ref 0
val _ = onKeyEvent (fn _ => timesPressed := (!timesPressed) + 1)

fun printIfPressed i =
    onKeyEvent (fn j => if i = j then print ("you pressed " ^ Int.toString i)
			else ())
	       
			    
