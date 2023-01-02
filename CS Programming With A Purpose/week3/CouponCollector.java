package week3;

public class CouponCollector {
    public static void main(String[] args) {
        int n = Integer.parseInt(args[0]);
        boolean[] isCollected = new boolean[n];
        int count = 0;
        int distinct = 0;

        //repeately choose a random card
        while (distinct < n) {
            int value = (int) (Math.random() * n);
            count++;
            
            if (!isCollected[value]) { //conditions that accept false statement i guess
                distinct++;
                isCollected[value] = true;
                
            }
            
        }
        //print the total number of cards collected
        System.out.println(count);
    }
    
}
