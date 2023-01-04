public class MaxMin {
    public static void main(String[] args) {
        // first value read initialized min and max
        int max = StdIn.readInt();
        int min = max;

        while (!StdIn.isEmpty()) {
            int val = StdIn.readInt();
            if (val > max) {
                max = val;
            }
            if (val < min) {
                min = val;
            }

        }

        // output
        StdOut.println("Maximum is " + max);
        StdOut.println("Minium is " + min);

    }
}
