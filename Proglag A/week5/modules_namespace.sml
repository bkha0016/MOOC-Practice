(* section 4: Modules for namespace management  *)

structure MyMathLib =
struct

fun fact x =
    if x = 0
    then 1
    else x * fact (x - 1)

val half_pi = Math.pi / 2.0
fun doubler y = y + y

end

val pi = MyMathLib.half_pi + MyMathLib.half_pi

val twenty_eight = MyMathLib.doubler 14				 



(* name space management
so far, this is just namespace management
- Giving a hierarchy to names to avoid shadowing
- allows different modules to reuse names e.g.: map
- Very important, but not very interesting

can use open ModuleName to get "direct" access to a module's bindings
- never necessary; just a convenience; often bad style


*)				     
