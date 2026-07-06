public class BlackScholes {

    // Black-Scholes formula
    public static double callPrice(double s, double x, double r, double sigma, double t) {
        double a = (Math.log(s / x) + (r + sigma * sigma / 2) * t) / (sigma * Math.sqrt(t));
        double b = a - sigma * Math.sqrt(t);
        return s * Gaussian.Phi(a) - x * Math.exp(-r * t) * Gaussian.Phi(b);
    }


    public static void main(String[] args) {
        double s = Double.parseDouble(args[0]);
        double x = Double.parseDouble(args[1]);
        double r = Double.parseDouble(args[2]);
        double sigma = Double.parseDouble(args[3]);
        double t = Double.parseDouble(args[4]);
        StdOut.println(callPrice(s, x, r, sigma, t));
    }
}
