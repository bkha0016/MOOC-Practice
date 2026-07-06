public class Brownian {
    public static void curve(double x0, double y0, double x1, double y1, double var, double s) {
        if (x1 - x0 < 0.01) {
            StdDraw.line(x0, y0, x1, y1);
            return;
        }
        double xm = (x0 + x1) / 2;
        double ym = (y0 + y1) / 2;
        double stddev = Math.sqrt(var);
        double delta = StdRandom.gaussian(0, stddev);
        curve(x0, y0, xm, ym + delta, var / s, s);
        curve(xm, ym + delta, x1, y1, var / s, s);
    }

    public static void main(String[] args) {
        double hurst = Double.parseDouble(args[0]);
        double s = Math.pow(2, 2 * hurst);
        curve(0, 0.5, 1.0, 0.5, 0.01, s);
    }
}
