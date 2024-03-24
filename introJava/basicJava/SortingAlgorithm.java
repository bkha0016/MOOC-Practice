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
    // The algorithm sorts an array by repeatedly finding the minium in an unsorted array and making it part of the sorted array
    // From unsorted part, we pick minimum element and swap it with leftmost element of unsorted part. After swap, that element now becomes part of sorted array
    // Its repeated until unsorted array is not empty
    public int[] SelectionSort(int[] arr) {
        int n = arr.length;
        for(int i = 0; i < n - 1; i++) {
            int min = i;
            for(int j = i + 1; j < n; j++) {
                if(arr[j] < arr[min]) {
                    min = j;
                }
            }

            int temp = arr[min];
            arr[min] = arr[i];
            arr[i] = temp;

        }

        return arr;
    }

    // Merge two sorted arrays
    // Given two sorted arrays, the task is to merge them in a sorted manner
    // ONLY WORKS in a SORTED ARRAYS
    public int[] merge(int[] arr1, int[] arr2, int n, int m) {
        int[] result = new int[n + m];
        int i = 0; int j = 0; int k = 0;

        while(i < n && j < m) {
            if(arr1[i] < arr2[j]) {
                result[k] = arr1[i];
                i++;
            } else {
                result[k] = arr2[j];
                j++;

            }
            k++;

        }

        while(i < n) {
            result[k] = arr1[i];
            i++; k++;
        }

        while(j < m) {
            result[k] = arr2[j];
            j++; k++;
        }

        return result;
    }

    // MERGE SORT
    // Merge Sort is a divide and conquer algorithm
    // DIVIDE - In this step the algorithm takes middle point of array and divides the array into 2 halves
    // The algorithm is carried out recursively for half arrays, until there are no more half arrays to divide
    // CONQUER - In this step starting from the bottom, we sort and merge the divided arrays and get the sorted arrays

    public void sortMerge(int[] arr, int[] temp, int low, int mid, int high) {
        for(int i = low; i <= high; i++) {
            temp[i] = arr[i];
        }
        int i = low; int j = mid + 1; int k = low;
        while(i <= mid && j <= high) {
            if(temp[i] <= temp[j]) {
                arr[k] = temp[i];
                i++;
            } else {
                arr[k] = temp[j];
                j++;
            }
            k++;
        }

        while(i <= mid) {
            arr[k] = temp[i];
            i++;
            k++;
        }
    }

    public int[] MergeSort(int[] arr, int[] temp, int low, int high) {
        if(low < high) {
            int mid = low + (high - low) / 2;
            MergeSort(arr, temp, low, mid);
            MergeSort(arr, temp, mid + 1, high);
            sortMerge(arr, temp, low, mid, high);

        }

        return arr;
    }

    // Sort an array of 0's, 1's, 2's (Dutch National Flag Problem)
    public int[] threeNumberSort(int[] arr) {
        int i = 0; 
        int j = 0; 
        int k = arr.length - 1;
        while(i <= k) {
            if(arr[i] == 0) {
                swap(arr, i, j);
                i++;
                j++;
                
            } else if(arr[i] == 1) {
                i++;
            } else if(arr[i] == 2) {
                swap(arr,i,k);
                k--;
            }
        }

        return arr;

    }

    public void swap(int[] arr, int i, int j) {
        int temp = arr[i];
        arr[i] = arr[j];
        arr[j] = temp;
    }

    // QUICK SORT
    // is a divide and conquer algorithm, It invovles 3 steps
    // Pivot Selection - we pick an element and mark it as pivot. The pivot element can be first element, last element, or any random element
    // Partitioning - We reorder the array such that all elements greater than pivot comes after the pivot and all elements samller than pivot comes before the pivot
    // The elements equal to pivot can go either side of the pivot. After this partitioning the pivot is at its correct sorted position.
    // Recursion - Recursively apply the above steps on the subarray formed to the left side of pivot and on the subarray formed on the right side of the pivot

    public int partition(int[] arr, int low, int high) {
        int pivot = arr[high];
        int i = low;
        int j = low;
        while(i <= high) {
            if(arr[i] <= pivot) {
                int temp = arr[i];
                arr[i] = arr[j];
                arr[j] = temp;
                j++;

            }
            i++;
        }

        return j - 1;

    }

    public int[] QuickSort(int[] arr, int low, int high) {
        if(low < high) {
            int p = partition(arr, low, high);
            QuickSort(arr, low, p - 1); // left
            QuickSort(arr, p + 1, high); // right

        }

        return arr;
    }

    public int[] arrangeMaxMin(int[] arr) {
        int maxIdx = arr.length - 1;
        int minIdx = 0;
        int max = arr[maxIdx] + 1;

        for(int i = 0; i < arr.length; i++) {
            if(i % 2 == 0) {
                arr[i] = arr[i] + (arr[maxIdx] % max) * max;
                maxIdx--;
            } else {
                arr[i] = arr[i] + (arr[minIdx] % max) * max;
                minIdx++;
            }
        }

        for(int i = 0; i < arr.length; i++) {
            arr[i] = arr[i] / max;
        }

        return arr;
    }






    public static void main(String[] args) {
        SortingAlgorithm sortAlgo = new SortingAlgorithm();
        int[] unsortedArr = {5, 1, 9, 2, 10};
        int[] unsortedArr2 = {7, 8, 12, 4, 3, 6};
        int[] unsortedArr3 = {1, 0, 2, 0, 1, 2, 2, 1, 0};
        int[] sortedArr = {2, 3, 5, 6, 8, 9};

        System.out.println(Arrays.toString(sortAlgo.BubbleSort(unsortedArr)));
        System.out.println(Arrays.toString(sortAlgo.InsertionSort(unsortedArr)));
        System.out.println(Arrays.toString(sortAlgo.SelectionSort(unsortedArr)));
        System.out.println(Arrays.toString(sortAlgo.merge(sortAlgo.SelectionSort(unsortedArr), sortAlgo.SelectionSort(unsortedArr2), unsortedArr.length, unsortedArr2.length)));
        System.out.println(Arrays.toString(sortAlgo.MergeSort(unsortedArr, new int[unsortedArr.length], 0, unsortedArr.length - 1)));
        System.out.println(Arrays.toString(sortAlgo.threeNumberSort(unsortedArr3)));
        System.out.println(Arrays.toString(sortAlgo.QuickSort(unsortedArr, 0, unsortedArr.length - 1)));
        System.out.println(Arrays.toString(sortAlgo.arrangeMaxMin(sortedArr)));
        
    }
}