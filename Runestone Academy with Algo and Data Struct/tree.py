'''
binary tree (BST) is similar to set in python
- every node has at most 2 child nodes

'''


from sre_constants import AT_END_STRING


my_tree = [
    "a",  # root
        ["b",  # left subtree
            ["d", [], []],
            ["e", [], []]
        ],
        ["c",  # right subtree
            ["f", [], []],
            []
        ],
    ]


#define left, root, and right subtree
'''
print('left tree: {}'.format(my_tree[1]))
print('root tree: {}'.format(my_tree[0]))
print('right tree: {}'.format(my_tree[2]))
'''

#making the binary tree
'''
one of the worst ways to represent a binary tree
stay away from this crap!!!
'''
def make_binary_tree(root):
    '''constructs a list with root node & 2 empty sublists for the children'''
    return [root, [], []]

def insert_left(root, new_child):
    old_child = root.pop(1) 
    if len(old_child) > 1: #if list has somethign in the 2nd position
        root.insert(1, [new_child, old_child, []])
    else:
        root.insert(1, [new_child, [], []])
    return root

def insert_right(root, new_child):
    old_child = root.pop(2)
    if len(old_child) > 1:
        root.insert(2, [new_child, [], old_child])
    else:
        root.insert(2, [new_child,[], []])
    
    return root

def get_root_val(root):
    return root[0]

def set_root_val(root, new_value):
    root[0] = new_value

def get_left_child(root):
    return root[1]

def get_right_child(root):
    return root[2]






#it works thanks indiann dude
class BinarySearchTreeNode():
    def __init__(self,data):
        self.data = data
        self.left = None
        self.right = None

    def add_child(self,data):
        if data == self.data:
            return
        
        if data < self.data: #assuming that the left subtree datas are smaller than the right subtree data
            #add data to the left subtree
            if self.left: #if theres already a data in the left node
                self.left.add_child(data)
            else:#if theres no data in the left node
                self.left = BinarySearchTreeNode(data)
        else:
            #add data in right subtree
            if self.right: #if theres already a data in the right node
                self.right.add_child(data)
            else:#if theres no data in the right node
                self.right = BinarySearchTreeNode(data)

    def in_order_traversal(self):
        elements = []

        #visit left tree
        if self.left:
            elements += self.left.in_order_traversal()
        #visit base node
        elements.append(self.data)

        #visit right tree:
        if self.right:
            elements += self.right.in_order_traversal()


        return elements

    
def build_tree(elements):
    root = BinarySearchTreeNode(elements[0])

    for i in range(1, len(elements)):
        root.add_child(elements[i])

    return root

'''
#test cases
if __name__ == '__main__':
    numbers = [17,4,1,20,9,23,18,34]
    numbers_tree = build_tree(numbers)

    print(numbers_tree.in_order_traversal())
'''
'''
class BinaryTree:
    def __init__(self,root_obj):
        self.key = root_obj
        self.left_child = None
        self.right_child = None

    def insert_left(self, new_node):
        if self.left_child is None:
            #when theres no left child, simply add left node to the tree
            self.left_child = BinaryTree(new_node)
        else:
            #existign left child, insert a node & push existign child down one level in the tree
            new_child = BinaryTree(new_node)
            new_child.left_child = self.left_child
            self.left_child = new_child #the new child becomes the parent, the prev becomes the child

    def insert_right(self, new_node):
        if self.right_child is None:
            self.right_child = BinaryTree(new_node)
        else:
            new_child = BinaryTree(new_node)
            new_child.right_child = self.right_child
            self.right_child = new_child

    def get_root_val(self):
        return self.key
    
    def set_root_val(self, new_obj):
        self.key = new_obj
    
    def get_left_child(self):
        return self.left_child

    def get_right_child(self):
        return self.right_child

'''
'''
a_tree = BinaryTree("a")
print(a_tree.get_root_val())
print('=======')
a_tree.insert_left("b")
print(a_tree.get_left_child().get_root_val())
print('=======')
l_tree = a_tree.get_left_child()
l_tree.insert_right('d')
l_tree.insert_left('idk')
print(a_tree.get_left_child().get_right_child().get_root_val())
print('=======')
a_tree.insert_right("c")
print(a_tree.get_right_child().get_root_val())
print('=======')
r_tree = a_tree.get_right_child()
r_tree.insert_right('e')
r_tree.insert_left('eee')

r2_tree = r_tree.get_right_child()
r2_tree.insert_right('g')
r2_tree.insert_left('h')

r3_tree = r_tree.get_left_child()
r3_tree.insert_left('mom')

r4_tree = r2_tree.get_right_child()
r4_tree.insert_right('donkey')
r4_tree.insert_left('moonki')

print(a_tree.get_right_child().get_right_child().get_root_val()) #e (seeing it from left->right)
print('==========')
print(a_tree.get_right_child().get_right_child().get_right_child().get_root_val())
print(a_tree.get_right_child().get_right_child().get_left_child().get_root_val())

'''

mathops = '(3+(4*5))'

def tokenize(string):
    new_list = list()
    for char in string:
        new_list.append(char)
    
    return new_list

#print(tokenize(mathops))

#tree traversals: preorder, inorder, postorder
'''
preorder: we vist the root node first, then recursively do a preorder traversal
of the left subtree, followed by a recursive preorder traversal of the right subtree

inorder: recursively do an inorder traversal on the left subtree, visis the root node, &
finally do a recursive inorder traversal of the right subtree

postorder: in a postorder traversal, we recursively do a postorder traversal
of the left subtree and the right subtree followed by a visit to the root node

'''
class BinaryTree:
    def __init__(self,root_obj):
        self.key = root_obj
        self.left_child = None
        self.right_child = None

    def insert_left(self, new_node):
        if self.left_child is None:
            #when theres no left child, simply add left node to the tree
            self.left_child = BinaryTree(new_node)
        else:
            #existign left child, insert a node & push existign child down one level in the tree
            new_child = BinaryTree(new_node)
            new_child.left_child = self.left_child
            self.left_child = new_child #the new child becomes the parent, the prev becomes the child

    def insert_right(self, new_node):
        if self.right_child is None:
            self.right_child = BinaryTree(new_node)
        else:
            new_child = BinaryTree(new_node)
            new_child.right_child = self.right_child
            self.right_child = new_child

    def get_root_val(self):
        return self.key
    
    def set_root_val(self, new_obj):
        self.key = new_obj
    
    def get_left_child(self):
        return self.left_child

    def get_right_child(self):
        return self.right_child

    
a_tree = BinaryTree("a")
#print(a_tree.get_root_val())
#print('=======')
a_tree.insert_left("b")
#print(a_tree.get_left_child().get_root_val())
#print('=======')
l_tree = a_tree.get_left_child()
l_tree.insert_right('d')
l_tree.insert_left('idk')
#print(a_tree.get_left_child().get_right_child().get_root_val())
#print('=======')
a_tree.insert_right("c")
#print(a_tree.get_right_child().get_root_val())
#print('=======')
r_tree = a_tree.get_right_child()
r_tree.insert_right('e')
r_tree.insert_left('eee')

r2_tree = r_tree.get_right_child()
r2_tree.insert_right('g')
r2_tree.insert_left('h')

r3_tree = r_tree.get_left_child()
r3_tree.insert_left('mom')

r4_tree = r2_tree.get_right_child()
r4_tree.insert_right('donkey')
r4_tree.insert_left('moonki')

def preorder(tree):
    result = ''
    if tree:
        result = '(' + tree.get_root_val()
        result = result + str(preorder(tree.get_left_child()))
        result = result + preorder(tree.get_right_child()) + ')' 
    
    return result



def postorder(tree):
    new_list = list()
    if tree:
        new_list.append(postorder(tree.get_left_child()))
        new_list.append(postorder(tree.get_right_child()))
        new_list.append(tree.get_root_val())
    
    return new_list


def inorder(tree):
    new_list = list()
    if tree:
        new_list.append(inorder(tree.get_left_child()))
        new_list.append(tree.get_root_val())
        new_list.append(inorder(tree.get_right_child()))
    
    return new_list


print(preorder(a_tree))
print(postorder(a_tree))
print(inorder(a_tree))













        










