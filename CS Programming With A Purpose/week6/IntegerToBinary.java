public class IntegerToBinary {
    public static void convert(int n) {
        if (n == 0) return;
        convert(n / 2);
        StdOut.print(n % 2);
    }

    public static void main(String[] args) {
        int n = Integer.parseInt(args[0]);
        convert(n);
        StdOut.println();

    }
}
