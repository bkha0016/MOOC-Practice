package week3;

public class HowMany {
    public static void main(String[] args) {
        
        //number of command-line arguments
        int n = args.length;

        //output message
        System.out.print("You entered " + n + " command-line argument");
        
        if (n == 1) System.out.println(".");
        else        System.out.println("s.");



        
    }
    
}
