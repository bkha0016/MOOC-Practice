public class ActivationFunction {
    // returns the heaviside function of x.
    public static double heaviside(double x) {
        // empty case result
        if (Double.isNaN(x)) return Double.NaN;
        double value = 0.0;
        if (x < 0) {
            value = 0.0;
        }
        else if (x == 0) {
            value = 0.5;

        }
        else {
            value = 1;
        }
        return value;
    }

    // returns the sigmoid function of x.
    public static double sigmoid(double x) {
        if (Double.isNaN(x)) return Double.NaN;
        return 1.0 / (1.0 + Math.exp(-x));

    }

    // returns the hyperbolic tangent of x.
    public static double tanh(double x) {
        if (Double.isNaN(x)) return Double.NaN;
        if (x >= 20) return 1.0;
        else if (x <= -20) return -1.0;
        else return (Math.exp(x) - Math.exp(-x)) / (Math.exp(x) + Math.exp(-x));
    }

    // returns the softsign function of x.
    public static double softsign(double x) {
        if (Double.isNaN(x)) return Double.NaN;
        else if (x == Double.POSITIVE_INFINITY) return 1.0;
        else if (x == Double.NEGATIVE_INFINITY) return -1.0;
        return (x / (1.0 + Math.abs(x)));

    }

    // returns the square nonlinearity function of x
    public static double sqnl(double x) {
        if (x <= -2) return -1.0;
        if (x > -2 && x < 0) return x + ((x * x) / 4.0);
        else if (x >= 0 && x < 2) return x - ((x * x) / 4.0);
        else return 1.0;
    }

    public static void main(String[] args) {
        double x = Double.parseDouble(args[0]);
        System.out.println("heaviside(" + x + ") = " + heaviside(x));
        System.out.println("sigmoid(" + x + ") = " + sigmoid(x));
        System.out.println("tanh(" + x + ") = " + tanh(x));
        System.out.println("softsign(" + x + ") = " + softsign(x));
        System.out.println("sqnl(" + x + ") = " + sqnl(x));

    }
}
