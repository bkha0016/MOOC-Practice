public class collatz {
    public static int collatz(int N) {
        StdOut.print(N + " ");
        // base case
        if (N == 1) return 1;
        if (N % 2 == 0) return collatz(N / 2);
        return collatz((N * 3) + 1);


    }

    public static void main(String[] args) {
        int N = Integer.parseInt(args[0]);
        System.out.println(collatz(N));

    }

}
