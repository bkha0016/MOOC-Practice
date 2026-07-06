import java.util.Stack;
import java.util.Arrays;

public class nextGreaterElement {

    public int[] nextGreaterElementMethod(int[] arr) {
        int[] result = new int[arr.length];
        Stack<Integer> stack = new Stack<>();
        for (int i = arr.length - 1; i >= 0; i--) {
            if(!stack.isEmpty()) {
                while(!stack.isEmpty() && stack.peek() <= arr[i]) {
                    stack.pop();
                }
            }

            if(stack.isEmpty()) {
                result[i] = -1;
            } else {
                result[i] = stack.peek();
            }
            stack.push(arr[i]);
        }

        return result;

    }
    public static void main(String[] args) {

        nextGreaterElement test = new nextGreaterElement();
        int[] testArr = {4,7,3,4,8,1};
        System.out.println(Arrays.toString(test.nextGreaterElementMethod(testArr)));
        
    }
    
}
