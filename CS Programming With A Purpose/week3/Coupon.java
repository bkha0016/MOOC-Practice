package week3;

public class Coupon {
    public static void main(String[] args) {
        int M = Integer.parseInt(args[0]);
        int cards = 0; //number of cards collected
        int distinct = 0; // number of distinct cards

        boolean[] found = new boolean[M]; //all values in the arrays are set in false mode

        while (distinct < M) {
            int r = (int) (Math.random() * M);
            cards++;
            

            if (!found[r]) {
                distinct++;
                found[r] = true;
                
            }
            
            
        }
        System.out.println(cards);
        
    }
    
}
