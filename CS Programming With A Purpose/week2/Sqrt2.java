package week2;

public class Sqrt2 {
    public static void main(String[] args) {
        Double x = Double.parseDouble(args[0]);
        Double sum = 0.0;

        for (double t = 1.0; t < (x/t); t++) {

            t = (x/t + t) / 2.0;
            sum = t;

            
        }

        System.out.println(Double.toString(sum));

        
    }
    
}
