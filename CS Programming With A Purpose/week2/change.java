package week2;
public class change {
    public static void main(String[] args) {
        int n = Integer.parseInt(args[0]);
        int quarter = 0;


        for (int coins = 0; coins <= n; coins++) {
            if (n/25 > 1) {
                quarter += 1;
                n = n/25;
                
            }
            
        }
        System.out.println(quarter);




        
    }
    
}
