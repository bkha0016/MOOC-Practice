public class ReverseString {
    // very basic way/method
    public static String RS(String s) {
        String new_s = "";
        for (int i = s.length() - 1; i >= 0; i--) {
            new_s = new_s + s.charAt(i);
        }
        return new_s;

    }

    // using string API through substring
    /*turns out the substring method in java is greatly differ than in python
     * substring in java cannot start in negative index or the start index is higher than the end index*/
    public static String RS1(String s) {
        if (s.length() <= 1) {
            return s;
        }
        return RS1(s.substring(1)) + s.substring(0, 1);

    }

    public static void main(String[] args) {
        String s = args[0];
        StdOut.println("Reverse String (RS) is " + RS(s));
        StdOut.println("Reverse String (RS1) is " + RS1(s));

    }
}
