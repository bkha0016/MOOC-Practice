public class Huntingtons {
    public static int maxRepeats(String dna) {
        int num = 0;
        int max = 0;
        int i = 0;
        while (i < dna.length() - 2) {
            String codon = dna.substring(i, i + 3);
            if (codon.equals("CAG")) {
                i += 3;
                num++;
                if (num > max) max = num;

            }
            else {
                i++;
                num = 0;
            }

        }
        return max;
    }

    // Returns a copy of s, with all whitespace (spaces, tabs, and newlines) removed
    public static String removeWhitespace(String s) {
        // removing newline in the file
        String s1 = s.replace("\n", "");
        // removing tabs in the file
        String s2 = s1.replace("\t", "");
        // removing whitespace in the file
        String s3 = s2.replace(" ", "");

        return s3;


    }

    public static String diagnose(int maxRepeats) {
        if (maxRepeats < 10 || maxRepeats > 180) return "not human";
        else if (maxRepeats < 36) return "normal";
        else if (maxRepeats < 40) return "high risk";
        else return "Huntington's";
    }


    // Sample client
    public static void main(String[] args) {
        String name = args[0];
        In in = new In(name);
        String s = in.readAll();
        String dna = removeWhitespace(s);
        int repeats = maxRepeats(dna);
        StdOut.println("max repeats = " + repeats);
        StdOut.println(diagnose(repeats));

    }
}
