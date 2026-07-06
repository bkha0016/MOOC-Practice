public class Factorial {
    public static long factorial(int n) {
        // whats the base case for factorial
        if (n == 1) return 1;
        return n * factorial(n - 1);
    }

    public static void main(String[] args) {
        int n = Integer.parseInt(args[0]);
        StdOut.println(factorial(n));

    }
}
