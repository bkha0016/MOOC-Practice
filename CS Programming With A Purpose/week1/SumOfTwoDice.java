public class SumOfTwoDice {

    public static void main(String[] args) {

        double dice1 = Math.random(); 
        double dice2 = Math.random();

        int value = (int) (dice1 * 6) + (int) (dice2 * 6);

        System.out.print(value);
        
    }
    
}
