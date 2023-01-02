package week2;

public class HarmonicNumber {
    public static void main(String args[]) {
        int n = Integer.parseInt(args[0]);
        double total = 0.0;

        for (int i = 1; i <= n; i++) {
            //remember that the i in here is an int
            //thats why it converts the num into a int type rather than a double type
             total = total + (1.0/i);
        }

        System.out.println(total);
        
    }
    
}
