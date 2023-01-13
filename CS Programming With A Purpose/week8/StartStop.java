public class StartStop {
    // this should include start and stop (no missing argument)
    public static String index(String s, String start, String stop) {
        String palgo = "";
        for (int i = 0; i <= s.length(); i++) {
            if (s.charAt(i) == start.charAt(0)) {
                // do a loop again
                for (int j = i; j <= s.length(); j++) {
                    if (s.charAt(j + 1) == stop.charAt(0)) {
                        return palgo;
                    }
                    palgo = palgo + s.charAt(j + 1);

                }
                return "Neither";

            }


        }
        return palgo;

    }
    
    // lets try using the API this time

    public static void main(String[] args) {
        String s = args[0];
        StdOut.println("The string between is " + index(s, args[1], args[2]));

    }
}
