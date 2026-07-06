import java.util.Random;

public class Generator {

    public static String randomString(int L, String alpha) {
        char[] a = new char[L];
        Random random = new Random();
        for(int i = 0; i < L; i++) {
            int t = random.nextInt(alpha.length());
            a[i] = alpha.charAt(t);
        }

        return new String(a);
    }

    public static void main(String[] args) {
        int N = Integer.parseInt(args[0]);
        int L = Integer.parseInt(args[1]);
        String alpha = args[2];

        for(int i = 0; i < N; i++) {
            System.out.println(randomString(L, alpha));
        }
        
    }
    
}
