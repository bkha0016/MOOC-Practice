public class BouncingBall {
    public static void main(String[] args) {
        double rx = .480, ry = .860;
        double vx = .015, vy = .023;

        double radius = 0.05;
        StdDraw.setXscale(-1.0, +1.0);
        StdDraw.setYscale(-1.0, +1.0);

        while (true) {
            // initiates the bg color in LIGHT_GRAY and filled it with square
            StdDraw.setPenColor(StdDraw.LIGHT_GRAY);
            StdDraw.filledSquare(0.0, 0.0, 1.0);
            // check system inplace
            if (Math.abs(rx + vx) + radius > 1.0) vx = -vx;
            if (Math.abs(ry + vy) + radius > 1.0) vy = -vy;
            // increment the value if its valid thru checking
            rx = rx + vx;
            ry = ry + vy;

            // draw the circle as animation does
            StdDraw.setPenColor(StdDraw.BLACK);
            StdDraw.filledCircle(rx, ry, radius);
            StdDraw.show(20);

        }

    }
}
