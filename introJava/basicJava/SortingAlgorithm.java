import java.util.Arrays;

public class SortingAlgorithm {

    // Bubble Sort
    // Its also called as Sinking Sort
    // While applying this sorting algorithm on unsorted array, the largest elements tends to sink at the end of the array
    // It repeatedly compares pair of adjacent elements and swap them if they are in wrong order
    public int[] BubbleSort(int[] arr) {
        int n = arr.length;
        boolean isSwapped;
        for(int i = 0; i < n - 1 ; i++) {
            isSwapped = false;
            for(int j = 0; j < n - 1 - i; j++) {
                if(arr[j] > arr[j + 1]) {
                    int temp = arr[j];
                    arr[j] = arr[j + 1];
                    arr[j + 1] = temp;
                    isSwapped = true;
                }
            }

            if(isSwapped == false) break;
        }

        return arr;
    }

    // Insertion Sort
    // Insertion sort is a simple sorting algorithm that works the way we sort playing cards in our hands
    // In Insertion sort we divide the given array into two parts - sorted part and unsorted part
    // From unsorted part, we take first element and place at its correct position in sorted array
    // This is done by shifting all the elements which are large than first element by one position
    // Its repeated till unsorted array is not empty

    public int[] InsertionSort(int[] arr) {
        int n = arr.length;

        for(int i = 1; i < n; i++) { // unsorted part
            int temp = arr[i];
            int j = i - 1; // sorted part
            while(j >= 0 && arr[j] > temp){
                arr[j + 1] = arr[j]; // shifting larger elements to temp by 1 position
                j = j - 1;

            }
            arr[j + 1] = temp;
        }

        return arr;

    }

    // Selection Sort
    // In selection sort we divide the given array into two parts - sorted part and unsorted part
    // The algorithm sorts an array by repeatedly finding the minium in an unsorted array and making it part of the sorted arra
    // From unsorted part, we pick minimum element and swap it with leftmost element of unsorted part. After swap, that element now becomes part of sorted array
    // Its repeated until unsorted array is not empty


    public static void main(String[] args) {
        SortingAlgorithm sortAlgo = new SortingAlgorithm();
        int[] unsortedArr = {5, 1, 9, 2, 10};

        System.out.println(Arrays.toString(sortAlgo.BubbleSort(unsortedArr)));
        System.out.println(Arrays.toString(sortAlgo.InsertionSort(unsortedArr)));

        
    }
}