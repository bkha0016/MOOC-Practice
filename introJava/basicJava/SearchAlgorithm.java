public class SearchAlgorithm {

    public int linearSearch(int[] arr, int n, int x) {
        for(int i = 0; i < n; i++) {
            if(arr[i] == x) {
                return i;
            }
        }

        return -1;
    }

    public int binarySearch(int[] nums, int key) {
        int low = 0;
        int high = nums.length - 1;

        while(low <= high) {
            int mid = (low + high) / 2;
            if (nums[mid] == key) {
                return mid;
            }
            if (key < nums[mid]) {
                high = mid - 1;
            } else {
                low = mid + 1;
            }

        }

        return -1;

    }

    public int searchInsert(int[] arr, int target) {
        int low = 0;
        int high = arr.length - 1;
        while(low <= high) {
            int mid = low + (high - low) / 2;
            if(arr[mid] == target) return mid;
            if(target < arr[mid]) {
                high = mid - 1;
            } else {
                low = mid + 1;
            }
        }

        return low;
    }



    public static void main(String[] args) {
        SearchAlgorithm ls = new SearchAlgorithm();
        int[] lsArr = {5, 1, 9, 2, 10, 15, 20};
        System.out.println(ls.linearSearch(lsArr, lsArr.length, 20));
        System.out.println(ls.linearSearch(lsArr, lsArr.length, 25));
        SearchAlgorithm bs = new SearchAlgorithm();
        int[] bsArr = {1, 10, 20, 47, 59, 65, 75, 88, 99};
        System.out.println(bs.binarySearch(bsArr, 88));
        System.out.println(bs.binarySearch(bsArr, 100));
        System.out.println(bs.searchInsert(bsArr, 77));

        

        
    }
    
}
