public class Sequence {
    public static String seq(int a, int b) {
        if (a == b) return "" + a;
        else if (b % 2 != 0) return "(" + seq(a, b - 1) + " + 1)";
        else if (b < 2 * a) return "(" + seq(a, b - 1) + " + 1)";
        else return seq(a, b / 2) + " * 2";

    }

    public static void main(String[] args) {
        int n = Integer.parseInt(args[0]);
        int m = Integer.parseInt(args[1]);

        System.out.println(seq(n, m));

    }
}
