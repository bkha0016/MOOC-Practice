public class Average1 {
    public static void main(String[] args) {
        double sum = 0.0;
        double avg = 0.0;
        int n = 0;

        while (!StdIn.isEmpty()) {
            double val = StdIn.readDouble();
            sum += val;
            n++;
        }
        avg = sum / n;
        StdOut.print("The average result is " + avg);


    }
}
