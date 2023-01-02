package week2;

public class AllEqual {
    public static void main(String[] args) {

        int a = Integer.parseInt(args[0]);
        int b = Integer.parseInt(args[1]);
        int c = Integer.parseInt(args[2]);

        if (a == b && b == c && a == c) {
            System.out.println("equal");

        }
        else{
            System.out.print("not equal");
        }
        
    }
    
}
