public class Fibonacci2 {
    public static long fib(double n) {
        if (n == 0 | n == 1 | n == 2) return 1;
        // even number
        if (n % 2 == 0) {
            return fib(((n + 1.0) / 2.0) * (n + 1.0) / 2.0) + fib(
                    ((n - 1.0) / 2.0) * ((n - 1.0) / 2.0));
        }
        else {
            return fib(((n / 2.0) + 1.0) * ((n / 2.0) + 1.0)) - fib(
                    ((n / 2.0) - 1.0) * ((n / 2.0) - 1.0));
        }
    }

    public static void main(String[] args) {
        double n = Double.parseDouble(args[0]);
        System.out.println("The fibonacci result of " + n + " is " + fib(n));

    }
}
