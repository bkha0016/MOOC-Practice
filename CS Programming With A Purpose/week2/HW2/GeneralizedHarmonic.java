public class GeneralizedHarmonic {
    public static void main(String[] args) {
        int n = Integer.parseInt(args[0]);
        int r = Integer.parseInt(args[1]);

        double total = 0.0;

        for (int i = 1; i <= n; i++) {

            total = total + (1/(Math.pow(i,r)));
            
        }
        
        System.out.println(total);
    }
    
}
