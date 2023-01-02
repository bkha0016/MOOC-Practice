package week2;

public class FunctionGrowth {
    //prints a table of the values of ln n, n, n ln, n^2, n^3, and 2^n for n = 16,32,64
    public static void main(String[] args) {
        System.out.println("ln n" + "\t" +"n"+"\t" + "nln n" + "\t" +"n^2"+"\t"+"n^3"+"\t"+"2^n");

        for (int i = 16; i <= 2048; i*=2 ) {
            System.out.println(Math.log(i) + "\t" + i + "\t" + (i * Math.log(i)) + "\t" + i*i + "\t" + i*i*i + "\t" + Math.pow(2,i));
        }
        
    }

    
}
