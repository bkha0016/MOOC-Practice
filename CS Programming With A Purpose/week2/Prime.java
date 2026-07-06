package week2;

public class Prime {
    public static void main(String[] args) {

        long n = Long.parseLong(args[0]);
        boolean isPrime = true;
        if (n < 2) isPrime = false;

        for (int Factor = 2; Factor * Factor <= n; Factor++) {

            if (n % Factor == 0) {
                isPrime = false;
                break;
                
            }

            
        }
        if (isPrime) {
            System.out.print(n + " is not a prime!");
            
        }
        else{
            System.out.print(n + " is a prime!");
        }


        
    }
    
}
