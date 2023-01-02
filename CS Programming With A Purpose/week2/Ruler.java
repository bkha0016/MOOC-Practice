package week2;

public class Ruler {
    public static void main(String[] args) {
        int N = Integer.parseInt(args[0]);
        String Ruler = " ";

        for (int i = 1; i <= N; i++) {
            Ruler = Ruler + i + Ruler;
        }
        System.out.println(Ruler);
        
    }
    
}
