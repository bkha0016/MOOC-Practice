import java.util.*;

public class validParentheses {

    boolean isValid(String s) {
        Stack<Character> stack = new Stack<>();
        for (char c : s.toCharArray()) {
            if (c == '(' || c == '{' || c == '[') {
                stack.push(c);
            } else {
                if (stack.isEmpty()) {
                    return false;
                } else {
                    char top = stack.peek();
                    if ((top == '(' && c == ')') || (top == '[' && c == ']') || (top == '{' && c == '}')) {
                        stack.pop();
                    } else {
                        return false;
                    }
                }
            }
        }
        return stack.isEmpty();
    }

    public static void main(String[] args) {
        validParentheses testParentheses = new validParentheses();
        System.out.println(testParentheses.isValid("({[]})"));
        System.out.println(testParentheses.isValid("{[])"));
        System.out.println(testParentheses.isValid("()"));
    }
}
