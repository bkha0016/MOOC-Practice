public class GaussianPlot {
    public static void main(String[] args) {
        int N = Integer.parseInt(args[0]);
        StdDraw.setXscale(-4.0, +4.0);
        StdDraw.setYscale(0, 0.5);
        StdDraw.setPenRadius(0.01);
        double[] x = new double[N + 1];
        double[] y = new double[N + 1];
        for (int i = 0; i <= N; i++) {
            x[i] = -4.0 + 8.0 * i / N;
            y[i] = Gaussian.pdf(x[i]);

        }
        for (int i = 0; i < N; i++) {
            StdDraw.line(x[i], y[i], x[i + 1], y[i + 1]);
        }

    }
}
