import java.util.Arrays;

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
        myArray[2] = -3;
        printArray(myArray);
        System.out.println(myArray.length);
        System.out.println(myArray[myArray.length - 1]);


        int[] myArray2 = {5,2,-1,2,3,4};

        printArray(myArray2);

        int[] newMyArray = {5, 2, -1, 1, 2, 3, -7};
        myPrintArray(newMyArray);
        myPrintArray(myArray);

        System.out.println("Removing even number in the array....");
        myPrintArray(removeEven(newMyArray));
        myPrintArray(removeEven(myArray));

        System.out.println("Removing odd number in the array....");
        myPrintArray(removeOdd(newMyArray));
        myPrintArray(removeOdd(myArray));

        System.out.println("Reversing a number in the array....");
        myPrintArray(reverseNum(newMyArray));
        myPrintArray(reverseNum(myArray));

        myPrintArray(reverseArray(newMyArray, 0, (newMyArray.length - 1)));
        myPrintArray(reverseArray(myArray, 0, (myArray.length - 1)));

        System.out.println("Finding the minimum number in an array");
        System.out.println(findMinimum(newMyArray));
        System.out.println(findMinimum(myArray));

        System.out.println("Finding the maximum number in an array");
        System.out.println(findMaximum(newMyArray));
        System.out.println(findMaximum(myArray));

        System.out.println("Finding the second maximum number in an array");
        System.out.println(secondMaximum(newMyArray));
        System.out.println(secondMaximum(myArray));

        System.out.println("Moving Zeroes to the end");
        int[] testArray = {0, 1, 0, 4, 12};
        myPrintArray(moveZeros(testArray, 5));
        myPrintArray(moveLeftZeros(testArray, 5));

        System.out.println("Resizes array");
        myPrintArray(resizeArray(newMyArray, newMyArray.length + 5));
        myPrintArray(resizeArray(myArray, myArray.length + 5));

        System.out.println("Finds a missing number");
        int[] testArray2 = {2, 4, 1, 8, 6, 3, 7};
        System.out.println(findMissingNumber(testArray2));

        System.out.println("Checking for palindrome");
        System.out.println(isPalindrome("madam"));
        System.out.println(isPalindrome("that"));




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
    // Create a method that reverses a number in an array
    // {2, 11, 5, 10, 7, 8} --> {8, 7, 10, 5, 11, 2}

    public int[] reverseNum(int[] arr) {
        int n = arr.length;
        int[] newArr = new int[n];
        int idx = 0;

        for (int i = (n - 1); i >= 0; i--) {
            newArr[idx] = arr[i];
            idx++;
        }

        return newArr;
    }

    public int[] reverseArray (int numbers[], int start, int end) {
        while (start < end) {
            int temp = numbers[start]; //temporary placeholder
            numbers[start] = numbers[end];
            numbers[end] = temp;
            start++;
            end--;
        }
        return numbers;
    }

    // Create a method that finds the minimum in an array
    public int findMinimum (int[] arr) {
        int min = arr[0];

        for(int i = 0; i < arr.length; i++) {
            if (arr[i] < min) {
                min = arr[i];
            }
        }
        return min;

    }

    // Create a method that finds the maximum in an array
    public int findMaximum(int[] arr) {
        int max = arr[0];

        for(int i = 0; i < arr.length; i++){
            if(arr[i] > max) {
                max = arr[i];
            }
        }

        return max;


    }

    // Create a method that finds the second maximum in an array
    public int secondMaximum(int[] arr) {
        int max = Integer.MIN_VALUE;
        int secondMax = Integer.MIN_VALUE;

        for(int i = 0; i < arr.length; i++) {
            if (arr[i] > max) {
                secondMax = max;
                max = arr[i];
            } else if (arr[i] > secondMax && arr[i] != max) {
                secondMax = arr[i];
            }
        }

        return secondMax;

    }

    // Create a method that moves all 0's to end of it while maintaining the relative order of the non-zero elements
    // {0, 1, 0, 4, 12} -> {1, 4, 12, 0, 0} basically swap the values

    public int[] moveZeros(int[] arr, int n) {
        int j = 0;
        for (int i = 0; i < n; i++) {
            if (arr[i] != 0 && arr[j] == 0) {
                int temp = arr[i];
                arr[i] = arr[j];
                arr[j] = temp;
            }

            if (arr[j] != 0) {
                j++;
            }

        }

        return arr;
    }

    // Create a method that moves all 0's to left of it while maintaining the relative order of the non-zero elements
    // {0, 1, 0, 4, 12} -> {0, 0, 1, 4, 12} basically swap the values

    public int[] moveLeftZeros(int[] arr, int n) {
        int j = 0;
        for (int i = 0; i < n; i++) {
            if (arr[i] == 0 && arr[j] != 0) {
                int temp = arr[j];
                arr[j] = arr[i];
                arr[i] = temp;
            }

            if (arr[j] == 0) {
                j++;
            }

        }

        return arr;
    }

    // Create a method that Resizes an Array
    // {5,9,3,10} -> {5,9,3,10,0,0,0,0}
    public int[] resizeArray(int[] arr, int capacity) {
        int[] temp = new int[capacity];
        for (int i = 0; i < arr.length; i++) {
            temp[i] = arr[i];
        }
        arr = temp;
        return arr;

    }

    // Create a method that finds a missing number
    // sum of an array = n * (n + 1) / 2

    public int findMissingNumber(int[] arr) {
        int n = arr.length + 1;
        int sum = (n * (n + 1)) / 2;

        for(int i = 0; i < arr.length; i++) {
            sum = sum - arr[i];
        }

        return sum;
    }

    // Create a method that cheks whether a string is palindrome or not

    public boolean isPalindrome(String word) {
        char[] charArray = word.toCharArray();
        int start = 0;
        int end = word.length() - 1;

        while (start < end) {
            if (charArray[start] != charArray[end]) {
                return false;
            }
            start++;
            end--;
        }
        return true;

    }



    public static void main(String[] args) {
        ArrayUtil arrUtil = new ArrayUtil();
        arrUtil.arrayDemo();
    }
    
}
