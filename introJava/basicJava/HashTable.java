public class HashTable {
    private HashNode[] buckets;
    private int numOfBuckets;
    private int size;

    public HashTable(int capacity) {
        this.numOfBuckets = capacity;
        buckets = new HashNode[capacity];
    }

    private class HashNode {
        private Integer key; // Can be generic
        private String value; // Can be generic
        private HashNode next;

        public HashNode(Integer key, String value) {
            this.key = key;
            this.value = value;
        }
    }


    public static void main(String[] args) {
        
    }
    
}
