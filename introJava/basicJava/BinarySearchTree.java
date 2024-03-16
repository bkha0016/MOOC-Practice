// What is a Binary Search Tree?
// It is a type of Binary Tree in which data is organized in an ordered manner which helps in faster search and insertion of data. It satisfies following properties
// The left subtree of a node contains only nodes with values lesser than the node's value
// The right subtree of a node contains only nodes with values greater than the node's value
// The left and righ subtree each must also be a binary search tree

import java.util.LinkedList;
import java.util.Queue;

public class BinarySearchTree {

    private TreeNode root;

    private class TreeNode {
        private int data;
        private TreeNode left;
        private TreeNode right;

        public TreeNode(int data) {
            this.data = data;
        }
    }

    public void insert(int value) {
        root = insert(root, value);
    }

    public TreeNode insert(TreeNode root, int value) {
        if (root == null) {
            root = new TreeNode(value);
            return root;
        }

        if (value < root.data) {
            root.left = insert(root.left, value);
        } else {
            root.right = insert(root.right, value);
        }

        return root;

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

    public TreeNode search(int key) {
        return search(root, key);
    }

    // How to search a given key in a Binary Search Tree
    public TreeNode search(TreeNode root, int key) {
        if (root == null || root.data == key) {
            return root;
        }

        if (key < root.data) {
            return search(root.left, key);
        } else {
            return search(root.right, key);
        }
    }

    // Binary Tree Validation Check
    public boolean isValid(TreeNode root, long min, long max) {
        if (root == null) {
            return true;
        }
        if (root.data <= min || root.data >= max) {
            return false;
        }

        boolean left = isValid(root.left, min, root.data);
        if (left) {
            boolean right = isValid(root.right, root.data, max);
            return right;
        }

        return false;

    }



    public static void main(String[] args) {
        BinarySearchTree testTree = new BinarySearchTree();
        testTree.insert(6);
        testTree.insert(4);
        testTree.insert(8);
        testTree.insert(2);
        testTree.insert(5);
        testTree.insert(7);
        testTree.insert(9);
        

        testTree.levelOrder();
        System.out.println(" ");
        if (null != testTree.search(9)) {
            System.out.println("Key Found !!!");
        } else {
            System.out.println("Key not found !!!");
        }

        
    }
    
}
