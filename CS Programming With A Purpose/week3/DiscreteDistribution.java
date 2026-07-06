package week3;

public class DiscreteDistribution {
    public static void main(String[] args) {

        //read in freq of occ of n values
        int n = args.length;
        int[] freq = new int[n];
        //mapping the values in the arrays
        for (int i = 0; i < n; i++) {
            freq[i] = Integer.parseInt(args[i]);
        }

        //compute the total count of all frequencies
        int total = 0;
        for (int i = 0; i < n; i++) {
            total += freq[i];
        }

        //generate random integer with probs proportional to freq
        int r = (int) (total * Math.random()); //[0, total)
        int sum = 0;
        int event = -1;
        for (int i = 0; i < n && sum <= r; i++) {
            sum += freq[i];
            event = i;
        }

        System.out.println(event);
        
    }
    
}
