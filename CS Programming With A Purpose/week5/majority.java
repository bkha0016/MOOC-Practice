public class majority {
    public static boolean majority(boolean a, boolean b, boolean c) {

        return (a && b) || (a && c) || (b && c);

    }

    public static void main(String[] args) {
        StdOut.println(majority(true, false, true));
        StdOut.println(majority(true, true, false));
        StdOut.println(majority(true, false, false));
        StdOut.println(majority(true, true, true));
        StdOut.println(majority(false, false, false));

    }
}
