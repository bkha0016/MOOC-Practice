// Its called two way linked list
// Given a node, we can navigate list in both forward & backward direction, which is not possible in Singly Linked List
// A node in singly linked list can only be deleted if we have a pointer to its previous node. But in Doubly Linked List we can delete the node even if we dont have pointer to its previous node
// ListNode in Doubly Linked List

import java.util.NoSuchElementException;

public class doublyLinkedList {

    private ListNode head;
    private ListNode tail;
    private int length;

    private class ListNode {
        private int data;
        private ListNode previous;
        private ListNode next;

        public ListNode(int data) {
            this.data = data;
        }
    }

    public doublyLinkedList() {
        this.head = null;
        this.tail = null;
        this.length = 0;
    }

    public boolean isEmpty() {
        return length == 0; // head == null
    }

    public int length() {
        return length;
    }

    public void insertLast(int value) {
        ListNode newNode = new ListNode(value);
        if(isEmpty()) {
            head = newNode;
        } else {
            tail.next = newNode;
        }
        newNode.previous = tail;
        tail = newNode;
        length++;
    }

    public void displayForward() {
        if (head == null) {
            return;
        }

        ListNode temp = head;
        while (temp != null) {
            System.out.print(temp.data + " --> ");
            temp = temp.next;
        }

        System.out.print("null");
        System.out.println("");
    }


    public void displayBackward() {
        if (tail == null) {
            return;
        }
        ListNode temp = tail;
        while (temp != null) {
            System.out.print(temp.data + " --> ");
            temp = temp.previous;
        }
        System.out.print("null");
        System.out.println("");

    }

    // Insert node at the beginning of a doubly linked list 
    public void insertFirst(int value) {
        ListNode newNode = new ListNode(value);
        if (isEmpty()) {
            tail = newNode;
        } else {
            head.previous = newNode;
        }
        newNode.next = head;
        head = newNode;
        length++;

    }
    // Insert node at the end of a doubly linked list
    public void insertEnd(int value) {
        ListNode newNode = new ListNode(value);
        if (isEmpty()) {
            head = newNode;
        } else {
            tail.next = newNode;
            newNode.previous = tail;
        }
        tail = newNode;
        length++;
    }

    // Delete first node in a doubly linked list
    public ListNode deleteFirst() {

        if(isEmpty()) {
            throw new NoSuchElementException();
        }

        ListNode temp = head;
        if (head == tail) {
            tail = null;
        } else {
            head.next.previous = null;
        }

        head = head.next;
        temp.next = null;
        return temp;
    }

    // Delete the end node in a doubly linked list
    public ListNode deleteEnd() {
        if(isEmpty()) {
            throw new NoSuchElementException();
        }
        ListNode temp = tail;
        if (head == tail) {
            head = null;
        } else {
            tail.previous.next = null;
        }
        tail = tail.previous;
        temp.next = null;
        return temp;
    }

    

    public static void main(String[] args) {
        doublyLinkedList dll = new doublyLinkedList();
        dll.insertLast(5);
        dll.insertFirst(10);
        dll.insertLast(15);
        dll.insertFirst(20);

        dll.displayForward();
        dll.displayBackward();
    }

}