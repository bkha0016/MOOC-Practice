public class Insertion {

    public static void sort(String[] a) {
        int N = a.length;
        for(int i = 1; i < N; i++) {
            for(int j = i; j > 0; j--) {
                if(a[j-1].compareTo(a[j]) > 0) {
                    exch(a, j - 1, j);
                } else {
                    break;
                }

            }
        }
    }

    private static void exch(String[] a, int i, int j) {
        String t = a[i]; a[i] = a[j]; a[j] = t;
    }

    public static void main(String[] args) {
        String[] a = {"c", "g", "a", "d", "b", "f", "e"};

        sort(a);
        for(int i = 0; i < a.length; i++) {
            System.out.print(a[i] + " ");
        }

    }
    
}
