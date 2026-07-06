public class Triangle {
    public static void main(String[] args) {
        double c = Math.sqrt(3.0) / 2.0;
        StdDraw.setPenRadius(0.01);
        StdDraw.line(0.0, 0.0, 1.0, 0.0);
        StdDraw.line(1.0, 0.0, 0.5, c);
        StdDraw.line(0.5, c, 0.0, 0.0);

        // text
        StdDraw.text(0.5, 0.5, "Hello, World");

    }
}
