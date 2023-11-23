public class Animal {
    
}

/* SOME CLASSES JUST SHOULD NOT BE INSTANTIATED
 * BY MARKING THE CLASS AS ABSTRACT -> COMPILER WILL STOP THE CODE
 * FROM EVER CREATING AN INSTANCE OF THAT TYPE
 *  IF YOU DECLARE AN ABSTRACT METHOD, YOU MUST MARK THE CLASS
 *  ABSTRACT AS WELL. YOU CANT HAVE AN ABSTRACT METHOD 
 * IN A NON-ABSTRACT CLASS.
 */

abstract class Canine extends Animal {
    public void roam() {}

    // abstract methodology <--- NEEDS TO BE USED UNDER THE CHILDREN CLASS 
    public abstract void eat();
 }

class Dog extends Canine {
    public void sound() {
        System.out.print("ruff!");
    }

    public void eat() {
      System.out.print("Grump!");
    }
 }

 /* COMPILER WONT LET YOU INSTANTIATE AN ABSTRACT CLASS
  * ABSTRACT WONT LET ANYBODY MAKE THE NEW INSTANCE OF THAT CLASS
  */

class MakeCanine {
    public void go() {
        Canine c;
        c = new Dog(); // this is OK, because you can assign a subclass object to a supercalss reference
        c = new Canine(); // this is not OK, compiler will stop you
        c.roam();
    }
  }