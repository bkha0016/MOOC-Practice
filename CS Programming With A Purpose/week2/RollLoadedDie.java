package week2;

public class RollLoadedDie {
    public static void main(String[] args) {
        double n = Math.random();

        if ((int)(n * 8) == (int)(1/8)){
            System.out.print((int)(n * 8));
        }
        else if ((int)(n * 8) == (int)(3/8)){
            System.out.print((int)(n * 8));
        }
        
    }
    
}
