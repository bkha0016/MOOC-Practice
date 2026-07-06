public class Gene {
    public static boolean isPotentialGene(String dna) {
        if (dna.length() % 3 != 0) return false;
        if (!dna.startsWith("ATG")) return false;
        for (int i = 0; i < dna.length() - 3; i += 3) {
            String codon = dna.substring(i, i + 3);
            if (codon.equals("TAA")) return false;
            if (codon.equals("TAG")) return false;
            if (codon.equals("TGA")) return false;

        }
        if (dna.endsWith("TAA")) return true;
        if (dna.endsWith("TAG")) return true;
        if (dna.endsWith("TGA")) return true;

        return false;
    }

    public static void main(String[] args) {
        StdOut.println(isPotentialGene(args[0]));

    }
}
