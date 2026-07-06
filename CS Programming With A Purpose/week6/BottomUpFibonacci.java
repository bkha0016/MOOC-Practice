public class BottomUpFibonacci {
    public static long fibonacci(int n) {
        // create an array that have memory match with the size of input
        long[] f = new long[n + 1];
        f[0] = 0;
        f[1] = 1;
        // do a for loop from the simplest to solve a complex problem
        for (int i = 2; i <= n; i++) {
            f[i] = f[i - 1] + f[i - 2];
        }
        return f[n];


    }

    public static void main(String[] args) {
        int n = Integer.parseInt(args[0]);
        StdOut.println("The result is " + fibonacci(n));

    }
}
