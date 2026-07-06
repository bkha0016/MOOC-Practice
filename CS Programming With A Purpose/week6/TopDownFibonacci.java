public class TopDownFibonacci {
    // around 100 arrays for memory storage
    // limit the number from 0 to 100
    private static long[] f = new long[100];

    public static long fib(int n) {
        // all possible base case in this recursion
        if (n == 0) return 0;
        if (n == 1) return 1;
        // calling the memory back
        if (f[n] > 0) return f[n];
        f[n] = fib(n - 1) + fib(n - 2);

        return f[n];


    }

    public static void main(String[] args) {
        int n = Integer.parseInt(args[0]);
        StdOut.println("The result is " + fib(n));


    }
}
