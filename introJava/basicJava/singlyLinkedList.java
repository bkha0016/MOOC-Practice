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

    public int head() {
        return head.data;
    }

    public int search(int position) {
        if (position == 1) {
            return head.data;
        } else {
            ListNode current = head;
            int count = 1;

            while (count < position) {
                if (current == null) {
                    return 0;
                }
                current = current.next;
                count++;
            }

            return current.data;


        }

    }


    public int tail() {
        ListNode current = head;

        while(current.next != null) {
            current = current.next;
        }

        return current.data;
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
    // Delete a node at a given position. Assuming position to be valid and starting from 1
    public ListNode deleteInsert(int position) {
        if (head == null || position <= 0) {
            // Invalid position or an empty list
            return head;
        }

        if (position == 1) {
            // Delete the first node
            ListNode temp = head;
            head = head.next;
            temp.next = null;
            return head;
        } else {
            ListNode current = head;
            ListNode previous = null;
            int count = 1;

            // Traverse the list to the node before the specified position
            while (count < position - 1 && current != null) {
                current = current.next;
                count++;
            }

            // check if the specified position is beyond the end of the list
            if (current == null || current.next == null) {
                return head; // Return the unchanged list
            }

            // Delete the node at the specified position
            previous = current;
            current = current.next;
            previous.next = current.next;
            current.next = null;

            return head;


        }

    }

    // A better version of delete insert in singly linked list
    public void delete(int position) {
        if (position == 1) {
            head = head.next;
        } else {
            ListNode previous = head;
            int count = 1;

            while (count < position - 1) {
                previous = previous.next;
                count++;
            }


            ListNode current = previous.next;
            previous.next = current.next;

        }



    }

    // Reverse a singly linked list
    public ListNode reverse() {
        
        if (head == null) {
            return head;
        }
        
        ListNode current = head;
        ListNode previous = null;
        ListNode next = null;

        while (current != null) {
            next = current.next;
            current.next = previous;
            previous = current;
            current = next;

        }
        
        return previous;
        

    }

    // Find nth node from the end of a Singly Linked List
    public ListNode getNthNodeFromEnd(int n) {
        if (head == null) {
            return null;
        }

        if(n <= 0) {
            throw new IllegalArgumentException("Invalid value: n" + n);
        }

        ListNode mainPtr = head;
        ListNode refPtr = head;

        int count = 0;

        while(count < n) {
            if(refPtr == null) {
                throw new IllegalArgumentException(n + " is greater than the number of nodes in the list");
            }

            refPtr = refPtr.next;
            count++;

        }

        while(refPtr != null) {
            refPtr = refPtr.next;
            mainPtr = mainPtr.next;
        }

        return mainPtr;
    }

    // Remove duplicate from sorted singly linked list
    public ListNode removeDuplicatedSorted() {
        ListNode current = head;

        while(current != null && current.next != null) {
            if (current.data == current.next.data) {
                current.next = current.next.next;
            } else {
                current = current.next;
            }
            
        }

        return current;

    }

    // Insert a node in a sorted singly linked list
    // 1 -> 8 - > 10 -> 16
    public ListNode insertNodeSorted(int value) {
        ListNode newNode = new ListNode(value);
        ListNode current = head;
        ListNode temp = null;

        while (current != null && current.data < newNode.data) {
            temp = current;
            current = current.next;
            
        }
        newNode.next = current;
        temp.next = newNode;

        return head;
    }

    // Remove a given key from singly linked list
    public void removeKey(int key) {
        ListNode current = head;
        ListNode temp = null;

        while (current != null && current.data != key) {
            temp = current;
            current = current.next;
        }

        if (current == null) {
            return;
        }
        
        temp.next = current.next;
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

    public boolean isSearch(int searchKey) {
        ListNode current = head;

        while (current != null) {
            if (current.data == searchKey) {
                return true;
            }
            current = current.next;
        }

        return false;
    }

    // Detect a loop in SSL
    public boolean containsLoop() {
        ListNode fastPtr = head;
        ListNode slowPtr = head;

        while(fastPtr != null && fastPtr.next != null) {
            fastPtr = fastPtr.next.next; //2x (double the speed)
            slowPtr = slowPtr.next; // x (a single constant speed)

            if(slowPtr == fastPtr) {
                return true;
            }

        }

        return false;
        

    }

    // start node in a loop
    public ListNode startNodeInALoop() {
        ListNode fastPtr = head;
        ListNode slowPtr = head;

        while(fastPtr != null && fastPtr.next != null) {
            fastPtr = fastPtr.next.next;
            slowPtr = slowPtr.next;

            if(slowPtr == fastPtr) {
                return getStartingNode(slowPtr);
            }

        }

        return null;
        

    }

    public void removeLoopInSSL() {
        ListNode fastPtr = head;
        ListNode slowPtr = head;

        while(fastPtr != null && fastPtr.next != null) {
            fastPtr = fastPtr.next.next;
            slowPtr = slowPtr.next;

            if(slowPtr == fastPtr) {
                removeLoop(slowPtr);
                return;
            }

        }    

    }

    public void removeLoop(ListNode slowPtr) {
        ListNode temp = head;
        while (temp.next != slowPtr.next) {
            temp = temp.next;
            slowPtr = slowPtr.next;
        }

        slowPtr.next = null;
    }


    private ListNode getStartingNode(ListNode slowPtr) {
        ListNode temp = head;
        while (temp != slowPtr) {
            temp = temp.next;
            slowPtr = slowPtr.next;
        }

        return temp; // starting node of the loop

    }

    // Merge two sorted list node
    public static ListNode merge(ListNode a, ListNode b) {
        // a --> 1 --> 3 --> 5 --> null
        // b --> 2 --> 4 --> 6 --> null
        // result --> 1 --> 2 --> 3 --> 4 --> 5 --> 6 --> null
        ListNode dummy = new ListNode(0);
        ListNode tail = dummy;

        while (a != null && b != null) {
            if(a.data <= b.data) {
                tail.next = a;
                a = a.next;
            } else {
                tail.next = b;
                b = b.next;
            }
            tail = tail.next;
        }

        // a --> 1 --> 3 --> null
        // b --> 2 --> 4 --> 6 --> 7 --> 9 --> 10 --> null
        // result --> 1 --> 2 --> 3 --> 4 --> 6 --> 7 --> 9 --> 10 --> null

        if (a == null) {
            tail.next = b;
        } else {
            tail.next = a;
        }

        return dummy.next;


    }

    // LeetCode #2 : Adding two numbers
    // Assume two numbers do not contain any leading zero, except the number 0 itself
    // digits are stored in reverse order and each of their nodes contains a single digit
    // Add the two numbers and return the sum as a linked list
    public static ListNode add(ListNode a, ListNode b) {
        ListNode dummy = new ListNode(0);
        ListNode tail = dummy;
        int carry = 0;

        while (a != null || b != null) {
            int x = (a != null) ? a.data : 0;
            int y = (b != null) ? b.data : 0;
            int sum = carry + x + y;
            carry = sum / 10;
            tail.next = new ListNode(sum % 10);
            tail = tail.next;
            if (a != null) a = a.next;
            if (b != null) b = b.next;

        }

        if (carry > 0) {
            tail.next = new ListNode(carry);
        }

        return dummy.next;
    }






    public void createALoopInLinkedList() {
        ListNode first = new ListNode(1);
        ListNode second = new ListNode(2);
        ListNode third = new ListNode(3);
        ListNode fourth = new ListNode(4);
        ListNode fifth = new ListNode(5);
        ListNode sixth = new ListNode(6);


    



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
        sll.insertFirst(20);
        sll.insertFirst(20);
        sll.display();

        sll.insertLast(30);
        sll.insertLast(55);
        sll.insertLast(55);
        sll.insertLast(55);
        sll.display();

        sll.deleteFirst();
        sll.display();

        sll.deleteLast();
        sll.display();

        sll.delete(3);
        sll.display();

        System.out.println(sll.tail());
        System.out.println(sll.head());

        System.out.println(sll.search(5));
        System.out.println(sll.search(3));
        System.out.println(sll.search(20));
        
        sll.display();

        System.out.println(sll.isSearch(30));
        System.out.println(sll.isSearch(89));

        System.out.println(sll.getNthNodeFromEnd(3).data);

        sll.removeDuplicatedSorted();
        sll.display();

        singlyLinkedList sll2 = new singlyLinkedList();
        sll2.head = new ListNode(1);
        sll2.insertFirst(2);
        sll2.insertFirst(3);
        sll2.insertFirst(4);
        sll2.insertFirst(5);
        sll2.display();

        singlyLinkedList sll3 = new singlyLinkedList();
        sll3.head = new ListNode(1);
        sll3.insertFirst(2);
        sll3.insertFirst(3);
        sll3.insertFirst(4);
        sll3.insertFirst(2);
        sll3.display();

        singlyLinkedList sll4 = new singlyLinkedList();

        sll4.head = add(sll3.head, sll2.head);
        sll4.display();



    }
    
}
