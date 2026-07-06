// It is a linear data structure used for storing the data
// Its an ordered list in which insertion and deletion are done at one end, called as top.
// The last element inserted is the first one to be deleted. Hence, it is called as Last In First Out (LIFO) list

import java.util.EmptyStackException;

public class stack {
    private ListNode top;
    private int length;

    private class ListNode {
        private int data;
        private ListNode next;

        public ListNode(int data) {
            this.data = data;
        }
    }

    public stack() {
        top = null;
        length = 0;

    }

    public int length() {
        return length;
    }

    public boolean isEmpty() {
        return length == 0;
    }

    public void push(int data) {
        ListNode temp = new ListNode(data);
        temp.next = top;
        top = temp;
        length++;
    }

    public int pop() {
        if (isEmpty()) {
            throw new EmptyStackException();
        }
        int result = top.data;
        top = top.next;
        length--;

        return result;

    }

    public int peek() {
        if (isEmpty()) {
            throw new EmptyStackException();
        }

        return top.data;
    }

    public static void main(String[] args) {

        stack stack = new stack();
        stack.push(10);
        stack.push(5);
        stack.push(8);

        System.out.println(stack.peek());
        System.out.println(stack.pop());
        System.out.println(stack.peek());
        
    }
    
}
