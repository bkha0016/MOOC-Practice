public class GoldenRatio {
    // taakes an integer input N and computes an approx to golden ratio
    // using a recursive formula
    public static double GR(double n) {
        if (n == 0) return 1;

        return 1.0 + (1.0 / GR(n - 1.0));
    }

    // non recursive ways
    public static double GR1(double n) {
        for (int i = n; i >= 1; i--) {
            
        }

    }


    public static void main(String[] args) {
        double n = Double.parseDouble(args[0]);

        StdOut.println("The golden ratio is (recursive mode) " + GR(n));


    }
}
