import java.lang.Math;
// Given: Two strings string s and t
// Task: Find the longest substring that appears at the beginning of both strings

public class LongestRepeatingSequence {
    // Checks for the largest common prefix
    public static String lcp(String s, String t) {
        int n = Math.min(s.length(), t.length());
        for(int i = 0; i < n; i++) {
            if(s.charAt(i) != t.charAt(i)) {
                return s.substring(0, i);
            }
        }

        return s.substring(0, n);

    }

    public static String lrs(String s) {
        int N = s.length();
        String lrs = "";
        for(int i = 0; i < N; i++) {
            for(int j = i+1; j < N; j++) {
                String x = lcp(s.substring(i, N), s.substring(j, N));
                if(x.length() > lrs.length()) lrs = x;
            }
        }

        return lrs;
    }
    
    public static String suffixLRS(String s) {
        int N = s.length();
        String[] suffixes = new String[N];
        for (int i = 0; i < N; i++) {
            suffixes[i] = s.substring(i, N);
        }

        // Merge.sort(suffixes)
        
        /*
        String lrs = "";
        for(int i = 0; i < N - 1; i++) {
            String x = lcp(suffixes[i], suffixes[i + 1]);
            if (x.length() > lrs.length()) lrs = x;
        }
         */
        return null;

        

    }

    public static void main(String[] args) {
        String s = "aacaagtttacaagc";
        System.out.println(lrs(s));
        
    }
}