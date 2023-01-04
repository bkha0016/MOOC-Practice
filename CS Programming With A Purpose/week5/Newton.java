public class Newton {
    public static double sqrt(double c, double eps) {
        if (c < 0) return Double.NaN;
        double t = c;
        while (Math.abs(t - c / t) > eps * t) {
            t = (c / t + t) / 2.0;
        }
        return t;
    }

    public static void main(String[] args) {
        // args.length based on the input received from user
        double[] a = new double[args.length];
        for (int i = 0; i < args.length; i++) {
            a[i] = Double.parseDouble(args[i]);

        }
        // mutate the arrays
        for (int i = 0; i < a.length; i++) {
            StdOut.println(sqrt(a[i], 1e-3));

        }

    }
}
