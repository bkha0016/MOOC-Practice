
/* STATIC IMPORT EXIST TO MAKE YOUR CODE A LITTLE SHORTER
 * THE DOWNSIDE TO STATIC IMPORTS IS THAT - IF YOU'RE NOT CAREFUL - USING THEM CAN MAKE YOUR CODE A LOT HARDER TO READ
 */




import static java.lang.Math.*;
import static java.lang.System.out;

class NoStatic {

    public static void main(String[] args) {
        System.out.println("sqrt " + Math.sqrt(2.0));
        System.out.println("tan " + Math.tan(60));
    }
    
}

class WithStatic {
    public static void main(String[] args) {
        out.println("sqrt " + sqrt(2.0));
        out.println("tan " + tan(60));
    }
}

