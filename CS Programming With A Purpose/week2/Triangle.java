package week2;

public class Triangle {
    public static void main(String[] args) {
        int N = Integer.parseInt(args[0]);
        int iter = 0;

        while (iter <= N) {
            
        
            for (int i = 0; i <= N; i++) {
                System.out.print(". ");
                
            }
            for (int j = 0; j < N-1; j++) {
                
                System.out.print("* ");
                
            }
            System.out.println();

            iter += 1;

        }
        
    }
    
}
