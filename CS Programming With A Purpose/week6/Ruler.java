public class Ruler {
    public static String ruler(int N) {
        // base case of recursion
        if (N == 0) return " ";
        return ruler(N - 1) + N + ruler(N - 1);
    }

    public static void main(String[] args) {
        int n = Integer.parseInt(args[0]);
        System.out.println(ruler(n));

    }
}
