public class Charge {

    // instance variabels
    private final double rx, ry; // position
    private final double q; // charge value

    // constructor
    public Charge(double x0, double y0, double q0) {
        rx = x0;
        ry = y0;
        q = q0;
    }

    // methods (not static)
    public double potentialAt(double x, double y) {
        double k = 8.99e09;
        double dx = x - rx;
        double dy = y - ry;
        return k * q / Math.sqrt(dx * dx + dy * dy);
    }

    public String toString() {
        return q + " at " + "(" + rx + ", " + ry + ")";
    }


    public static void main(String[] args) {
        Charge c = new Charge(.72, .31, 21.3);
        StdOut.println(c); // reminder: automatically invokes c.toString()
        StdOut.printf("%6.2e\n", c.potentialAt(.42, .71));

    }
}
