package week3;

public class intro_arr {
    public static void main(String[] args) {
        
    //declare an array
    double[] a; 
    //create an array and its type based on the lenght
    a = new double[10];

    System.out.println(a[0]);
    a[4] = 3.0;
    a[8] = 8.0;

    double x = a[4] + a[8];
    
    //declare an array with its type
    double[] b;
    //create an array of the given length
    b = new double[100000];
    
    System.out.println(b[3874]);
    //accesing its index
    b[83923] = 982.3;
    b[20932] = 786.2;

    double y = b[83923] + b[20932];

    System.out.println(x);
    System.out.println(y);

    //calculate the length of the array
    System.out.println(a.length);
    System.out.println(b.length);



    
    }
}
