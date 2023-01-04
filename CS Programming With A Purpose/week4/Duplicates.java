public class Duplicates {
    public static void main(String[] args) {
        // i would rather have an array to do but cant be used in this problem
        // give a case if theres no input

        if (StdIn.isEmpty()) {
            StdOut.println("No input stream from user");
            return;
        }

        // input stream continious
        int prev = StdIn.readInt();
        StdOut.print(" " + prev + " ");

        while (!StdIn.isEmpty()) {
            int current = StdIn.readInt();

            if (current != prev) {
                StdOut.print(" " + current + " ");
                prev = current;
            }
            
        }


    }
}
