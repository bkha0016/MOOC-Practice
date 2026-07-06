(*
Full definition for pattern matching:
The semantics for pattern-matching takes a pattern p and a value v and decides (1)
does it match and (2) if so, what variable bindings are introduced

- If p is a variable x, the match succeeds and x is bound to v
- If p is _, the match succeeds and no bindings are introduced
- If p is (p1,...., pn) and v is (v1,...., vn) the match succeeds if and only
if p1 matches v1, ..., pn matches vn. The bindings are the uniion of all bindings
from the submatches
- If p is C p1, the match succeeds if v is C v1 (same constructor) and p1 matches v1.
The bindings aare the bindings from the submatch

... (there are several other similar forms of patterns)




Examples:
- Pattern a :: b :: c :: d matches all lists with >= 3 elements
- Pattern a :: b :: c :: [] matches all lists withh 3 elements
- Pattern ((a,b), (c,d)) :: e matches all non-empty list of pairs of pairs


*)

(*function patterns*)

(*
In general

fun f x =
    case x of
       p1 => e1
      | p2 => e2

fun f p1 = e1
| f p2 = e2
| f pn  = en


is this code fast enough or slow????????
compared to python ofc it will be faster
compared to C++ we dont know




*)
