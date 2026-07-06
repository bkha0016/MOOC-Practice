#Recursion: Solving problmes that invovles breaking a problem down into smaler & smaler subproblems

from os import remove


l1 = [1,3,5,7,9]

def list_sum(num_list):
    if len(num_list) == 1: #basecase
        return num_list[0]
    else:
        return num_list[0] + list_sum(num_list[1:]) #change of state
    


print(list_sum(l1))

'''
Three laws of Recursion:
1.Recursive algo must have a base case
2.Recursive algo change the state towards the base case
3.A recrusive algo must called itself recursively

'''
#Converting an Integer to a String in Any Base

def to_str(n, base):
   convert_string = "0123456789ABCDEF"
   if n < base: #base case
      return convert_string[n]
   else:
      return to_str(n // base, base) + convert_string[n % base]

print(to_str(1453, 16))


def factorial(n):
    if n <= 1:
        return n
    else:
        return n * factorial(n-1)
    

print(factorial(20))

def reverse(string):
    if len(string) == 1:
        return string[-1]
    elif len(string) == 0:
        return ""
    else:
        return string[-1] + reverse(string[:-1])

print(reverse('python'))


def remove_white(s):
    s1 = s.replace(' ','')
    s2 = s1.replace("'",'')
    return s2





def palindrome(string):
    if len(string) <= 1:
        return True
    if string[0] != string[-1]:
        return False
    else:
        return palindrome(string[1:-1])
        

   

print(palindrome('alibohphobila'))
print(palindrome('earth'))
print(palindrome('kayak'))

print(palindrome('hannah'))

print(remove_white("madam i'm adam"))


#Stack frames: Implementing Recursion
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



def to_str(n,base):
    r_stack = Stack()
    convert_string = '0123456789ABCDEF'

    while n > 0:
        if n < base:
            r_stack.push(convert_string[n])
        else:
            r_stack.push(convert_string[n % base])

        n = n // base
    
    res = ''

    while not r_stack.is_empty():
        res += str(r_stack.pop())

    return res


print(to_str(1453,16))

#Visualizing Recursion in Py

import turtle

def draw_spiral(my_turtle, line_len):
    if line_len > 0:
        my_turtle.forward(line_len)
        my_turtle.right(90)
        draw_spiral(my_turtle, line_len - 5)

'''
my_turtle = turtle.Turtle()
my_win = turtle.Screen()
draw_spiral(my_turtle, 100)
my_win.exitonclick()
'''
import random


def tree(branch_len, t):
    mode =['red','blue','green','purple']
    if branch_len > 5:
        t.width(branch_len//3)
        #t.pencolor(mode[branch_len % 1000])
        t.forward(branch_len)
        t.right(15)
        tree(branch_len - random.randint(1,10), t)
        t.left(45)
        tree(branch_len - random.randint(1,20), t)
        t.right(30)

        t.backward(branch_len)
        
        
    

def main():
    t = turtle.Turtle()
    my_win = turtle.Screen()
    t.left(90)
    t.up()
    t.backward(100)
    t.down()
    t.color("green")
    tree(75, t)
    my_win.exitonclick()

#main()


#Sierpinski Triangle

import turtle


def draw_triangle(points, color, my_turtle):
    my_turtle.fillcolor(color)
    my_turtle.up()
    my_turtle.goto(points[0][0], points[0][1])
    my_turtle.down()
    my_turtle.begin_fill()
    my_turtle.goto(points[1][0], points[1][1])
    my_turtle.goto(points[2][0], points[2][1])
    my_turtle.goto(points[0][0], points[0][1])
    my_turtle.end_fill()


def get_mid(p1, p2):
    return ((p1[0] + p2[0]) / 2, (p1[1] + p2[1]) / 2)


def sierpinski(points, degree, my_turtle):
    colormap = ["blue", "red", "green", "white", "yellow", "violet", "orange"]
    draw_triangle(points, colormap[degree], my_turtle)
    if degree > 0:
        sierpinski(
            [points[0], get_mid(points[0], points[1]), get_mid(points[0], points[2])],
            degree - 1,
            my_turtle,
        )
        sierpinski(
            [points[1], get_mid(points[0], points[1]), get_mid(points[1], points[2])],
            degree - 1,
            my_turtle,
        )
        sierpinski(
            [points[2], get_mid(points[2], points[1]), get_mid(points[0], points[2])],
            degree - 1,
            my_turtle,
        )


def main():
    my_turtle = turtle.Turtle()
    my_win = turtle.Screen()
    my_points = [[-180, -150], [0, 150], [180, -150]]
    sierpinski(my_points, 5, my_turtle)
    my_win.exitonclick()


#main()

#Tower of Hanoi
def move_tower(height, from_pole, to_pole, with_pole): #3, A,B,C
    if height >= 1:
        move_tower(height - 1, from_pole, with_pole, to_pole)# 2,A,C,B -> 1,A,B,C -> 0, A,C,B
        move_disk(from_pole, to_pole)
        move_tower(height - 1, with_pole, to_pole, from_pole)#2,C,B,A -> 1,


def move_disk(from_p, to_p):
    print("moving disk from", from_p, "to", to_p)


move_tower(3, "A", "B", "C")