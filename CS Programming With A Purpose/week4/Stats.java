public class Stats {
    public static void main(String[] args) {
        int n = Integer.parseInt(args[0]);
        // initializing arrays based on its n length
        double[] a = new double[n];

        // read data and compute statistics
        for (int i = 0; i < n; i++) {
            a[i] = StdIn.readDouble();
        }

        // compute mean
        double sum = 0.0;
        for (int i = 0; i < n; i++) {
            sum += a[i];
        }
        double mean = sum / n;

        // compute standard deviation
        double sum2 = 0.0;
        for (int i = 0; i < n; i++) {
            sum2 += (a[i] - mean) * (a[i] - mean);
        }
        double stddev = Math.sqrt(sum2 / (n - 1));

        // print results
        StdOut.println("Mean                      = " + mean);
        StdOut.println("Sample standard deviation = " + stddev);
    }
}
