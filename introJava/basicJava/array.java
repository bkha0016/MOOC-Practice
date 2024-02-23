import java.util.Arrays;

public class array {

    public static void arrayDemo() {
        int[] myArray = new int[7];
        myArray[0] = 5;
        myArray[1] = 1;
        myArray[2] = 8;
        myArray[3] = 2;
        myArray[4] = 10;
        myArray[2] = 9;
        myArray[5] = 7;
        System.out.println(Arrays.toString(myArray));

    }

    public static void main(String[] args) {
        arrayDemo();
    }

}