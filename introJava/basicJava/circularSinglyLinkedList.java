// Its similar to Singly Linked List, with a difference that in circular linked list the last node points to first node and not null
// Instead of head, we keep track of last node in Circular Singly List

import java.security.NoSuchAlgorithmException;
import java.util.NoSuchElementException;

public class circularSinglyLinkedList {

    private ListNode last;
    private int length;

    private class ListNode {
        private ListNode next;
        private int data;

        public ListNode(int data) {
            this.data = data;

        }

    }

    public circularSinglyLinkedList() {
        last = null;
        length = 0;
    }

    public int length() {
        return length;
    }

    public boolean isEmpty() {
        return length == 0;
    }

    public void createCircularLinkedList() {
        ListNode first = new ListNode(1);
        ListNode second = new ListNode(5);
        ListNode third = new ListNode(10);
        ListNode fourth = new ListNode(15);

        // It needs to be a circular singly linked list
        first.next = second;
        second.next = third;
        third.next = fourth;
        fourth.next = first;

        last = fourth;
    }

    // Traverse and Print a circular singly linked list
    public void display() {
        if (last == null) {
            return;
        }
        ListNode first = last.next;
        while (first != last) {
            System.out.print(first.data + " ");
            first = first.next;
        }

        System.out.print(first.data);
        System.out.println("");

    }

    // Insert node at the start of a circular singly linked list
    public void insertFirst(int data) {
        ListNode temp = new ListNode(data);

        if (last == null) {
            last = temp;
        } else {
            temp.next = last.next;
        }
        last.next = temp;
        length++;
    }

    //Insert node at the end of a circular singly linked list
    public void insertEnd(int data) {
        ListNode temp = new ListNode(data);

        if (last == null) { // isEmpty()
            last = temp;
            last.next = last;
        } else {
            temp.next = last.next;
            last.next = temp;
            last = temp;
        }
        
        length++;
    }
    // Remove first node from a circular singly linked list
    public ListNode removeFirst() {
        if (isEmpty()) {
            throw new NoSuchElementException();
        }
        ListNode temp = last.next;
        if (last.next == null) {
            last = null;
        } else {
            last.next = temp.next;
        }
        temp.next = null;
        length--;
        return temp;
    }

    // Remove last node from a circular singly linked list
    public ListNode removeEnd() {
        if (isEmpty()) {
            throw new NoSuchElementException();
        }

        ListNode current = last;

        // Iterate until the node whose next points to the last node
        while (current.next != last) {
            current = current.next;
        }

        // If there is only one node, set last to null
        if (current == last) {
            last = null;
        } else {
            // Update the next reference to skip the last node
            current.next = last.next;
            last = current;
        }

        length--;
        return last;
    }




    public static void main(String[] args) {
        circularSinglyLinkedList csll = new circularSinglyLinkedList();
        csll.createCircularLinkedList();

        csll.display();
        
        csll.insertFirst(5);
        csll.insertFirst(2);
        csll.display();

        csll.insertEnd(100);
        csll.insertEnd(38);
        csll.display();
        
        csll.removeFirst();
        csll.display();

        csll.removeEnd();
        csll.display();
        
    }
    
}
