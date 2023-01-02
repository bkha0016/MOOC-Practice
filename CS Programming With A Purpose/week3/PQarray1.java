package week3;

public class PQarray1 {
    public static void main(String[] args) {
        //lets create arrays
        int[] a = new int[6];
        int[] b = new int[a.length];
        //before
        System.out.println(a[2]);

        //anythign happens to b will affect a
        b = a;

        //fill the b's with i increments
        for (int i = 0; i < b.length; i++) {
            b[i] = i;
            
        }
        //after initialize
        System.out.println(a[2]);

        //printing the arrays of a
        //inside a's will be zero
        for (int i = 0; i < a.length; i++) {
            System.out.print(a[i] + " ");
            
        }
        System.out.println();

        //inside b's will be filled with the previous i's increments
        for (int i = 0; i < b.length; i++) {
            System.out.print(b[i] + " ");
            
        }

        System.out.println();


        
    }
    
}
