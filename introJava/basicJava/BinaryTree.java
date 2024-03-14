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
        TreeNode third = new TreeNode(4);
        TreeNode fourth = new TreeNode(3);
        TreeNode fifth = new TreeNode(5);

        root = first; // root --> first
        first.left = second;
        first.right = third; // second <-- first --> third

        second.left = fourth;
        



    }

    public void preOrder(TreeNode root) {
        if (root == null) { // base case
            return;
        }
        System.out.print(root.data + " ");
        preOrder(root.left);
        preOrder(root.right);
    }

    public static void main(String[] args) {
        BinaryTree testTree = new BinaryTree();
        testTree.createBinaryTree();
        testTree.preOrder(testTree.root);
        
    }

}