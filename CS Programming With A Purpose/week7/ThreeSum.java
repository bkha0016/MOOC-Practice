public class ThreeSum {
    /*brute for method takes a long time
     * big o notation is here might be around O(n^3)
     * very slow, requires dynamic programming
     * */
    public static int count1(int[] a) {
        int N = a.length;
        int cnt = 0;
        for (int i = 0; i < N; i++) {
            for (int j = i + 1; j < N; j++) {
                for (int k = j + 1; k < N; k++) {
                    if (a[i] + a[j] + a[k] == 0) {
                        cnt++;
                    }

                }

            }

        }
        return cnt;

    }

    public static void main(String[] args) {
        int[] a = StdIn.readAllInts();
        // measure the running time
        double start = System.currentTimeMillis() / 1000.0;
        int cnt = count1(a);
        double now = System.currentTimeMillis() / 1000.0;
        StdOut.printf("%d (%.0f seconds)\n", cnt, now - start);

    }
}
