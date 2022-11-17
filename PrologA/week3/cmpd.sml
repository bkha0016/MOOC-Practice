Standard ML of New Jersey v110.80 [built: Thu Aug 18 15:00:00 2016]
- val x = {bar = (1+2, true andalso true) ,foo = 3 + 4, baz = (false,9)};
val x = {bar=(3,true),baz=(false,9),foo=7}
  : {bar:int * bool, baz:bool * int, foo:int}
- x;
val it = {bar=(3,true),baz=(false,9),foo=7}
  : {bar:int * bool, baz:bool * int, foo:int}
- val my_niece = {name = "Amelia", id = 41123-12};
val my_niece = {id=41111,name="Amelia"} : {id:int, name:string}
- #id my_niece;
val it = 41111 : int
- val brain_part = {id=true, ego = false, superego = false};
val brain_part = {ego=false,id=true,superego=false}
  : {ego:bool, id:bool, superego:bool}
- #superego brain_part;
val it = false : bool
- #ego brain_part;
val it = false : bool
- #d brain_part;
stdIn:8.1-8.14 Error: operator and operand don't agree [record labels]
  operator domain: {d:'Y; 'Z}
  operand:         {ego:bool, id:bool, superego:bool}
  in expression:
    (fn {d=d,...} => d) brain_part
- #d brain_part;
stdIn:1.2-1.15 Error: operator and operand don't agree [record labels]
  operator domain: {d:'Y; 'Z}
  operand:         {ego:bool, id:bool, superego:bool}
  in expression:
    (fn {d=d,...} => d) brain_part
- 