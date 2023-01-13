// import the necessary libraries

import java.awt.Color;

public class Luminance {
    // Color c => color is the datatype
    // hoping for a return in a double datatype
    public static double lum(Color c) {
        int r = c.getRed();
        int g = c.getGreen();
        int b = c.getBlue();
        return .299 * r + .587 * g + .114 * b;
    }

    public static boolean compatible(Color a, Color b) {
        return Math.abs(lum(a) - lum(b)) > 128.0;
    }

    public static Color toGray(Color c) {
        int y = (int) Math.round(lum(c));
        Color gray = new Color(y, y, y);
        return gray;
    }

    public static void main(String[] args) {
        // This is for lum (a)
        int r = Integer.parseInt(args[0]);
        int g = Integer.parseInt(args[1]);
        int b = Integer.parseInt(args[2]);
        Color c = new Color(r, g, b);

        // This is for lum (b)
        int r1 = Integer.parseInt(args[3]);
        int g1 = Integer.parseInt(args[4]);
        int b1 = Integer.parseInt(args[5]);
        Color c1 = new Color(r1, g1, b1);
        // This is for monochrome luminance
        StdOut.println(Math.round(lum(c)));
        // Calculate the compatible
        StdOut.println(compatible(c, c1));
        // convert to grayscale values
        StdOut.println(toGray(c));

    }
}
