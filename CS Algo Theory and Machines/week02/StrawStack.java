public class StrawStack {
    private String[] a;
    private int N = 0;

    public StrawStack(int max) {
        a = new String[max];
    }

    public boolean isEmpty() {
        return (N == 0);
    }

    public void push(String item) {
        a[N++] = item;
    }

    public String pop() {
        return a[--N];
    }

    public int size() {
        return N;
    }

    public static void main(String[] args) {
        int max = Integer.parseInt(args[0]);
        StrawStack stack = new StrawStack(max);
        
    }
    
}
