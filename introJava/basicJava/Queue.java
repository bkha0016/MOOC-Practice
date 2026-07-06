// It is a linear data structure used for storing the data
// Its an ordered list in which insertion are done at one end
// called as rear and deletion are done at other end called as front
// The first elemetn inserted is the first one to be deleted.
// Hence it is called as First In First Out (FIFO) list.

import java.util.NoSuchElementException;

public class Queue {

    private ListNode front;
    private ListNode rear;
    private int length;

    private class ListNode {
        private int data;
        private ListNode next;

        public ListNode(int data) {
            this.data = data;
            this.next = null;
        }
    }

    public int length() {
        return length;
    }

    public boolean isEmpty() {
        return length == 0;
    }

    public void enqueue(int data) {
        ListNode temp = new ListNode(data);
        if (isEmpty()) {
            front = temp;
        } else {
            rear.next = temp;
        }

        rear = temp;
        length++;
    }

    public int dequeue() {
        if (isEmpty()) {
            throw new NoSuchElementException("Queue is already empty");
        }
        int result = front.data;
        front = front.next;
        if (front == null) {
            rear = null;
        }
        length--;
        return result;
    }

    public void print() {
        if (isEmpty()) {
            return;
        }
        ListNode current = front;
        while (current != null) {
            System.out.print(current.data + " --> ");
            current = current.next;
        }
        System.out.print("null");
        System.out.println("");
    }

    public int first() {
        if (isEmpty()) {
            throw new NoSuchElementException("Queue is already empty");
        }
        return front.data;
    }

    public int last() {
        if (isEmpty()) {
            throw new NoSuchElementException("Queue is already empty");
        }

        return rear.data;
    }


    public static void main(String[] args) {
        Queue q1 = new Queue();
        q1.enqueue(5);
        q1.enqueue(8);
        q1.enqueue(15);
        q1.print();
        q1.dequeue();
        q1.print();
        q1.enqueue(30);
        q1.print();
        System.out.println(q1.first());
        System.out.println(q1.last());
        
    }
    
}
