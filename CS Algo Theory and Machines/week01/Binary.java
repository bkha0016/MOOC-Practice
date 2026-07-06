public class Binary {
    public static int search(String key, String[] a) {
        int low = 0; int high = a.length; int mid; int cmp;
        while(low < high) {
            mid = low + (high - low) / 2;
            cmp = a[mid].compareTo(key);

            if (cmp > 0) {
                high = mid;
            } else if (cmp < 0) {
                low = mid + 1;
            } else {
                return mid;
            }
        } 

        return -1;
        
    }
    public static int recursiveSearch(String key, String[] a, int low, int high) {
        int mid; int cmp;
        if(high <= low) return -1; // base case of recursion
        mid = low + (high - low) / 2;
        cmp = a[mid].compareTo(key);
        if (cmp > 0) return recursiveSearch(key, a, low, mid);
        else if (cmp < 0) return recursiveSearch(key, a, mid + 1, high);
        else return mid; // also considers as a base case

    }

    public static void main(String[] args) {
        String[] a = {"abc", "de", "f", "ge"}; // only works if the array of string is sorted based on its alphabetical value
        for (String str : a) {
            System.out.print(search(str, a));
            System.out.print(recursiveSearch(str, a, 0, a.length));
            System.out.println(" ");
        }
    }

    
}
