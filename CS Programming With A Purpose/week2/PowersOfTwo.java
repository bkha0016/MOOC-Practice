package week2;

public class PowersOfTwo {
    public static void main(String[] args) {
        int n = Integer.parseInt(args[0]);
        int i = 0;
        

        while (i <= n) {

            System.out.println((int) Math.pow(2, i));
            i = i + 1;
            
        }
        
    }
    
}
