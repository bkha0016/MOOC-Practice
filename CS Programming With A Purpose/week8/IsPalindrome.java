public class IsPalindrome {
    public static boolean IP(String s) {
        int n = s.length();
        for (int i = 0; i < n / 2; i++) {
            if (s.charAt(i) != s.charAt(n - i - 1)) return false;
        }
        return true;
    }

    public static void main(String[] args) {
        String s = StdIn.readString();
        StdOut.println("Is it a palindrome? " + IP(s));

    }
}
