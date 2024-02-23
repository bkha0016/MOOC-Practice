public class ArrayUtil {
    public void printArray(int[] arr) {
        int n = arr.length;
        for (int i = 0; i < n; i++) {
            System.out.print(arr[i] + " ");
        }
        System.out.println();
    }

    public static void myPrintArray(int[] arr) {
        int n = arr.length;
        for (int i = 0; i < n; i++) {
            System.out.print(arr[i] + " ");
        }
        System.out.println();

    }

    public void arrayDemo() {
        int[] myArray = new int[5];

        myArray[0] = 5;
        myArray[1] = 1;
        myArray[2] = 8;
        myArray[3] = 2;
        myArray[4] = 10;
        myArray[2] = 9;
        printArray(myArray);
        System.out.println(myArray.length);
        System.out.println(myArray[myArray.length - 1]);


        int[] myArray2 = {5,2,-1,2,3,4};

        printArray(myArray2);

        int[] newMyArray = {1, 2, 3};
        myPrintArray(newMyArray);
        myPrintArray(myArray);

        System.out.println("Removing even number in the array....");
        myPrintArray(removeEven(newMyArray));
        myPrintArray(removeEven(myArray));

        System.out.println("Removing odd number in the array....");
        myPrintArray(removeOdd(newMyArray));
        myPrintArray(removeOdd(myArray));



    }

    // Create a method that removes even number in an array
    public int[] removeEven(int[] arr) {
        int n = arr.length;
        int oddCount = 0;

        for (int i = 0; i < n; i++) {
            if (arr[i] % 2 != 0) {
                oddCount += 1;
            }
        }

        int idx = 0;
        int[] oddArr = new int[oddCount];

        for (int i = 0; i < n; i++) {
            if (arr[i] % 2 != 0) {
                oddArr[idx] = arr[i];
                idx++;
            }
        }

        return oddArr;
    }

    // Create a method that removes odd number in an array
    public int[] removeOdd(int[] arr) {
        int evenCount = 0;
        int n = arr.length;

        for (int i = 0; i < n; i++) {
            if (arr[i] % 2 == 0) {
                evenCount++;
            }
        }

        int[] evenArr = new int[evenCount];
        int idx = 0;

        for (int i = 0; i < n; i++) {
            if (arr[i] % 2 == 0) {
                evenArr[idx] = arr[i];
                idx++;
            }

        }

        return evenArr;


    }

    public static void main(String[] args) {
        ArrayUtil arrUtil = new ArrayUtil();
        arrUtil.arrayDemo();
    }
    
}
