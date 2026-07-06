public class AddInts {
    public static void main(String[] args) {
        int n = Integer.parseInt(args[0]);
        int sum = 0;

        for (int i = 0; i < n; i++) {
            int val = StdIn.readInt();
            sum += val;
        }

        StdOut.print("The total sum is " + sum);

    }
}
