package week2;

public class Exp {

    public static void main(String[] args) {
        double x = Double.parseDouble(args[0]);
        System.out.println(Math.exp(x));

        // for negative argument, use identity e^-x =  1/e^x
        boolean isNegative = false;
        if (x < 0) {
            isNegative = true;
            x = -x;
        }

        // compute e^x assuming x >= 0
        double term = 1.0;
        double sum = 0.0;
        for (int n = 1; sum != sum + term; n++) {
            sum += term;
            term *= x/n;
        }

        // print results
        if (isNegative)
            sum = 1.0 / sum;
        System.out.println(sum);
    }
}
