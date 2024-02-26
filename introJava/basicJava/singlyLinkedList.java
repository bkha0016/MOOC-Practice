public class singlyLinkedList {

    private ListNode head;

    private static class ListNode {
        private int data; // Generic Type
        private ListNode next;


        public ListNode(int data) {
            this.data = data;
            this.next = null;
        }
    }

    // Print out the results of the SLL

    public void display() {
        ListNode current = head;

        while(current != null) {
            System.out.print(current.data + " --> ");
            current = current.next;
        }
        System.out.print("null");
        System.out.println("");

    }

    // Find the length of the SLL
    public int getLength() {
        ListNode current = head;
        int nodeCounter = 0;

        while (current != null) {
            nodeCounter++;
            current = current.next;
        }

        return nodeCounter;

    }

    // Insert nodes in the beginning of a SSL
    public void insertFirst(int value) {
        ListNode newNode = new ListNode(value);
        newNode.next = head;
        head = newNode;



    }

    // Deletes nodes in the beginning of a SSL
    public ListNode deleteFirst() {
        if (head == null) {
            return null; //theres nothing to delete
        }
        ListNode temp = head;
        head = head.next;
        temp.next = null;
        return temp;
         
        
    }

    // Insert nodes in the last of SLL
    public void insertLast(int value) {
        ListNode newNode = new ListNode(value);

        if (head == null) {
            // If the list is empty, make the new node the head
            head = newNode;
            return;
        }

        ListNode current = head;

        while(current.next != null) {
            current = current.next;
            if (current.next == null) {
                current.next = newNode;
                newNode.next = null;
                break;
            }
        }

    }

    // Deletes nodes in the end of a SSL
    public ListNode deleteLast() {
        if (head == null) {
            return null; //theres nothing to delete
        }

        // If there is only one node in the list, delete it
        if (head.next == null) {
            ListNode temp = head;
            head = null;
            return temp;
        }
        
        ListNode current = head;
        ListNode previous = null;

        while(current.next != null) {
            previous = current;
            current = current.next;
        }

        // Delete the last node
        previous.next = null;
        return current;
        
         
        
    }




    // Insert node at a given position. Assuming position to be valid & starting from 1
    public void insert(int position, int value) {
        // 1 -> 4 -> 5
        // 1 -> 6 -> 4 -> 5

        ListNode node = new ListNode(value);

        if(position == 1) {
            node.next = head;
            head = node;
        } else {
            ListNode previous = head;
            int count = 1; // position : 1

            while (count < position - 1) {
                previous = previous.next;
                count++;
            }

            ListNode current = previous.next;
            previous.next = node;
            node.next = current;


        }



    }



    public static void main(String[] args) {
        singlyLinkedList sll = new singlyLinkedList();
        sll.head = new ListNode(10);
        ListNode second = new ListNode(1);
        ListNode third = new ListNode(8);
        ListNode fourth = new ListNode(11);

        // Now we will connect them together to form a chain
        sll.head.next = second; // 10 --> 1
        second.next = third; // 10 --> 1 --> 8
        third.next = fourth; // 10 --> 1 --> 8 --> 11 --> null

        sll.display();
        System.out.println(sll.getLength());

        sll.insertFirst(15);
        sll.insertFirst(20);
        sll.display();

        sll.insertLast(30);
        sll.insertLast(55);
        sll.display();

        sll.deleteFirst();
        sll.display();

        sll.deleteLast();
        sll.display();
        


    }
    
}
