import java.util.Stack;
import java.util.LinkedList;
import java.util.Queue;

public class BinaryTree {

    private TreeNode root; // The first Node in the Binary Tree

    private class TreeNode {
        private TreeNode left;
        private TreeNode right;
        private int data; // Generic type

        public TreeNode(int data) {
            this.data = data;
        }
    }


    public void createBinaryTree() {
        TreeNode first = new TreeNode(9);
        TreeNode second = new TreeNode(2);
        TreeNode third = new TreeNode(3);
        TreeNode fourth = new TreeNode(4);
        TreeNode fifth = new TreeNode(5);

        root = first; // root --> first
        first.left = second;
        first.right = third; // second <-- first --> third

        second.left = fourth;
        



    }

    public void inOrder(){
        if (root == null) {
            return;
        }
        Stack<TreeNode> stack = new Stack<>();
        TreeNode temp = root;
        while(!stack.isEmpty() || temp != null) {
            if(temp != null) {
                stack.push(temp);
                temp = temp.left;
            } else {
                temp = stack.pop();
                System.out.print(temp.data + " ");
                temp = temp.right;
            }
        }

    }


    public void recursiveInOrder(TreeNode root) {
        if(root == null) {
            return;
        }
        recursiveInOrder(root.left);
        System.out.print(root.data + " ");
        recursiveInOrder(root.right);
    }

    public void preOrder() {
        if (root == null) {
            return;
        }
        Stack<TreeNode> stack = new Stack<>();
        stack.push(root); // There's a root in the stack

        while(!stack.isEmpty()) {
            TreeNode temp = stack.pop();
            System.out.print(temp.data + " ");
            if(temp.right != null) {
                stack.push(temp.right);
            }
            if(temp.left != null) {
                stack.push(temp.left);
            }

        }
    }





    public void recursivePreOrder(TreeNode root) {
        if (root == null) { // base case
            return;
        }
        System.out.print(root.data + " ");
        recursivePreOrder(root.left);
        recursivePreOrder(root.right);
    }

    public void recursivePostOrder(TreeNode root) {
        if (root == null) {
            return;
        }
        recursivePostOrder(root.left);
        recursivePostOrder(root.right);
        System.out.print(root.data + " ");
    }

    public void postOrder() {
        TreeNode current = root;
        Stack<TreeNode> stack = new Stack<>();

        while(current != null || !stack.isEmpty()){
            if(current != null){
                stack.push(current);
                current = current.left;
            } else {
                TreeNode temp = stack.peek().right;
                if(temp == null){
                    temp = stack.pop();
                    System.out.print(temp.data + " ");

                    while(!stack.isEmpty() && temp == stack.peek().right) {
                        temp = stack.pop();
                        System.out.print(temp.data + " ");

                    }

                } else {
                    current = temp;

                }

            }

        }
        


    }

    public void levelOrder() {
        if (root == null) {
            return;
        }
        Queue<TreeNode> queue = new LinkedList<>();
        queue.offer(root);

        while(!queue.isEmpty()) {
            TreeNode temp = queue.poll();
            System.out.print(temp.data + " ");
            if (temp.left != null) {
                queue.offer(temp.left);
            }
            if (temp.right != null) {
                queue.offer(temp.right);
            }
        }

    }

    public int recursiveFindMax() {
        return recursiveFindMax(root);
    }

    public int recursiveFindMax(TreeNode root) {
        if(root == null) {
            return Integer.MIN_VALUE;
        }

        int result = root.data;
        int left = recursiveFindMax(root.left);
        int right = recursiveFindMax(root.right);
        if (left > result) {
            result = left;
        }
        if (right > result) {
            result = right;
        }
        return result;
    }
    // Implement a find max using level order traversal

    public int levelOrderFindMax() {
        if (root == null) {
            return Integer.MIN_VALUE;
        }
        Queue<TreeNode> queue = new LinkedList<>();
        queue.offer(root);
        int result = root.data;

        while(!queue.isEmpty()) {
            TreeNode temp = queue.poll();
            if (temp.data > result) {
                result = temp.data;
            }
            if (temp.left != null) {
                queue.offer(temp.left);
            }
            if (temp.right != null) {
                queue.offer(temp.right);
            }
        }

        return result;

    }

    public int levelOrderFindMin() {
        if (root == null) {
            return Integer.MAX_VALUE;
        }
        Queue<TreeNode> queue = new LinkedList<>();
        queue.offer(root);
        int result = root.data;

        while(!queue.isEmpty()) {
            TreeNode temp = queue.poll();
            if (temp.data < result) {
                result = temp.data;
            }
            if (temp.left != null) {
                queue.offer(temp.left);
            }
            if (temp.right != null) {
                queue.offer(temp.right);
            }
        }

        return result;


    }


    public static void main(String[] args) {
        BinaryTree testTree = new BinaryTree();
        testTree.createBinaryTree();
        testTree.inOrder(); // 4 2 9 3
        System.out.println(" ");
        testTree.recursiveInOrder(testTree.root); // 4 2 9 3
        System.out.println(" ");
        testTree.preOrder();
        System.out.println(" ");
        testTree.recursivePreOrder(testTree.root); // 9 2 4 3
        System.out.println(" ");
        testTree.recursivePostOrder(testTree.root); // 4 2 3 9
        System.out.println(" ");
        testTree.postOrder(); // 4 2 3 9
        System.out.println(" ");
        testTree.levelOrder(); // 9 2 3 4
        System.out.println(" ");
        System.out.print(testTree.recursiveFindMax()); // 9 
        System.out.println(" ");
        System.out.print(testTree.levelOrderFindMax()); // 9
        System.out.println(" ");
        System.out.print(testTree.levelOrderFindMin());

        
    }

}