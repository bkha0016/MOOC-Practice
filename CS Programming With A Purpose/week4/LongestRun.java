public class LongestRun {
    public static void main(String[] args) {
        // degenerate case with no input integers
        if (StdIn.isEmpty()) StdOut.print("no longest consecutive run");
        return;

        int prev = StdIn.readInt();
        int count = 1;
        int best = prev;
        int bestCount = count;

        while (!StdIn.isEmpty()) {
            // read in the next value
            int current = StdIn.readInt();

            // update the current run
            if (current == prev) count++;
            else {
                prev = current;
                count = 1;
            }

            // update champion values
            if (count > bestCount) {
                bestCount = count;
                best = current;
            }

        }

        StdOut.println("Longest run " + bestCount + " consecutive " + best + "s");


    }
}
