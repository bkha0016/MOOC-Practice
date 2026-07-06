public class PoolPuzzleOne {
    public static void main (String[] args){
        int x = 0;
        while (x < 4) {

            if (x < 1) {
                System.out.print("a");
            }
            System.out.print("noise");

            if (x > 3) {
                System.out.print("annoys");
            }

            if (x == 1) {
                System.out.print("an");
            }

            if (x > 0) {
                System.out.print(" oyster ");
            }
        }
    }
    
}
