public class PQfunctions1a {
    public static int cube(int i) {
        // more compact of a code
        return i * i * i;
    }

    public static void main(String[] args) {
        int N = Integer.parseInt(args[0]);
        for (int i = 1; i <= N; i++) {
            StdOut.println(i + " " + cube(i));
        }

    }
}
