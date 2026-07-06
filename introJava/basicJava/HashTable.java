public class HashTable {
    private HashNode[] buckets;
    private int numOfBuckets; // capacity
    private int size; // number of key value pairs in hash table or number of hash nodes in a hash table

    
    public HashTable() {
        this(10); // default capacity
    }

    public HashTable(int capacity) {
        this.numOfBuckets = capacity;
        buckets = new HashNode[capacity];
        this.size = 0;
    }

    private class HashNode {
        private Integer key; // Can be generic
        private String value; // Can be generic
        private HashNode next; // reference to next HashNode

        public HashNode(Integer key, String value) {
            this.key = key;
            this.value = value;
        }
    }

    public int getBucketIndex(Integer key) {
        return key % numOfBuckets; // or you can use buckets.length
    }

    public int size() {
        return size;
    }

    public boolean isEmpty() {
        return size == 0;
    }

    public void put(Integer key, String value) {

        if(key == null || value == null) {
            throw new IllegalArgumentException("Key or Value is null !!!");
        }

        int bucketIndex = getBucketIndex(key);
        HashNode head = buckets[bucketIndex];
        while(head != null) {
            if(head.key.equals(key)) {
                head.value = value;
                return;
            }
            head = head.next;
        }

        size++;
        head = buckets[bucketIndex];
        HashNode node = new HashNode(key, value); // (key, value) --> null
        node.next = head;
        buckets[bucketIndex] = node;

    }

    public String get(Integer key) {
        if (key == null) {
            throw new IllegalArgumentException("Key is null !!!");
        }
        int bucketIndex = getBucketIndex(key);
        HashNode head = buckets[bucketIndex];
        while(head != null) {
            if(head.key.equals(key)) {
                return head.value;
            }
            head = head.next;
        }
        return null;
    }

    public String remove(Integer key) {
        if(key == null) {
            throw new IllegalArgumentException("Key is null !!!");
        }
        int bucketIndex = getBucketIndex(key);
        HashNode head = buckets[bucketIndex];
        HashNode previous = null;

        while(head != null) {
            if(head.key.equals(key)) {
                break;
            }
            previous = head;
            head = head.next;

        }

        if(head == null) { return null;}
        size--;
        if(previous != null) {
            previous.next = head.next;
        } else {
            buckets[bucketIndex] = head.next;
        }
        return head.value;
    }


    public static void main(String[] args) {
        HashTable table = new HashTable();
        table.put(105, "Tom");
        table.put(21, "Sana");
        table.put(21, "Harry"); // Updating the value in key 21
        table.put(31, "Dinesh"); // Chaining the value in the hash 31 % 10
        System.out.println(table.size());  
        System.out.println(table.get(21));
        System.out.println(table.get(31));
    }
    
}
