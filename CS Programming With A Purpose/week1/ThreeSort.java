public class ThreeSort {
    public static void main(String[] args) {
        //initializing the values 
        int val1 = Integer.parseInt(args[0]);
        int val2 = Integer.parseInt(args[1]);
        int val3 = Integer.parseInt(args[2]);

        //sort them in ascending order

        int min_val = Math.min(val3, Math.min(val1, val2));
        int max_val = Math.max(val3, Math.max(val1, val2));
        int mid_val = Math.min(val3, Math.max(val1, val2));

        System.out.println(min_val);
        System.out.println(max_val);
        System.out.println(mid_val);
        


        
    }
    
}
