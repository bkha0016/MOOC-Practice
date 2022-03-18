#Linear Data Structures: Stacks, Queues, deques, & lists


class Stack:
    """Stack implementation as a list"""

    def __init__(self):
        """Create new stack"""
        self._items = []

    def is_empty(self):
        """Check if the stack is empty"""
        return not bool(self._items)

    def push(self, item):
        """Add an item to the stack"""
        self._items.append(item) #O(1)

    def pop(self):
        """Remove an item from the stack"""
        return self._items.pop() #O(1)

    def peek(self):
        """Get the value of the top item in the stack"""
        return self._items[-1]

    def size(self):
        """Get the number of items in the stack"""
        return len(self._items)




def rev_string(my_str):
    new_s = Stack()


    for word in my_str:
        new_s.push(word)
    
    new_str = ''
    for _ in range(len(my_str)):
        new_str += new_s.pop()

    return new_str

print(rev_string('hello'))


def par_checker(string):
    check = Stack()

    for word in string:
        if word == '(':
            check.push(word)
        else:
            if check.is_empty():
                return False
            else:
                check.pop()
    
    return check.is_empty()


print(par_checker('()()()()'))

def balanced_symbols(string):
    check = Stack()

    for word in string:
        if word == '(' or word == '[' or word == '{':
            check.push(word)
        else:
            if word == ')' and check.peek() == '(':
                check.pop()

            elif word == ']' and check.peek() == '[':
                check.pop()

            elif word == '}' and check.peek() == '{':
                check.pop()
            
            else:
                return False

    return True

print(balanced_symbols('[][][](){}'))
print(balanced_symbols('([)]'))

def divide_by_2(number):
    dish = Stack()
    
    while number != 0:
        dish.push(number%2)
        number = number//2

    dish._items.reverse()
    new_s = ''

    for i in dish._items:
        new_s += str(i)

    return new_s


print(divide_by_2(42))
print(divide_by_2(25))



def infix_to_postfix(infix_expr):
    prec = {}
    prec["*"] = 3
    prec["/"] = 3
    prec["+"] = 2
    prec["-"] = 2
    prec["("] = 1
    op_stack = Stack()
    postfix_list = []
    token_list = infix_expr.split()

    for token in token_list:
        if token in "ABCDEFGHIJKLMNOPQRSTUVWXYZ" or token in "0123456789":
            postfix_list.append(token)
        elif token == "(":
            op_stack.push(token)
        elif token == ")":
            top_token = op_stack.pop()
            while top_token != "(":
                postfix_list.append(top_token)
                top_token = op_stack.pop()
        else:
            while (not op_stack.is_empty()) and (prec[op_stack.peek()] >= prec[token]):
                postfix_list.append(op_stack.pop())
            op_stack.push(token)

    while not op_stack.is_empty():
        postfix_list.append(op_stack.pop())

    return " ".join(postfix_list)

print(infix_to_postfix("A * B + C * D"))
print(infix_to_postfix("( A + B ) * C - ( D - E ) * ( F + G )"))

print(infix_to_postfix('A + B + C / D'))

    
    
    





            

