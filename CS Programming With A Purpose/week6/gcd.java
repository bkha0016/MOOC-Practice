public class gcd {
    // recursive implementation
    public static int gcd1(int p, int q) {
        if (q == 0) return p;
        else return gcd1(q, p % q);

    }

    // non recursive implementation
    public static int gcd2(int p, int q) {
        while (q != 0) {

            int temp = q;
            q = p % q;
            p = temp;
        }
        return p;

    }


    public static void main(String[] args) {
        int n = Integer.parseInt(args[0]);
        int m = Integer.parseInt(args[1]);
        StdOut.println(gcd1(n, m));
        System.out.println(gcd2(n, m));


    }
}
