#Introduction: Test Cases
from logging import raiseExceptions


def square(x):
    '''Raise x to the second power'''
    return x*x

'''
assert square(2) == 4
'''

#Program Devs w/ Test Cases
def distance(x1,y1,x2,y2):
    dx = x2 - x1
    dy = y2 - y1
    dsquared = dx**2 + dy**2
    result = dsquared ** 0.5
    return result

'''
assert distance(1,2,1,2) == 0
assert distance(1,2,4,6) == 5
assert distance(0,0,1,1) == 2**0.5
'''
#Testing Classes

class Point:

    def __init__(self,initX, initY):
        self.x = initX
        self.y = initY

    def distanceFromOrigin(self):
        return ((self.x**2)+(self.y**2))**0.5

    def move(self,dx,dy):
        self.x = self.x + dx
        self.y = self.y + dy


p = Point(3,4)

#testing class constructor (__init__ method)
assert p.y == 4
assert p.x == 3

assert p.distanceFromOrigin() == 5.0

#testing the move method
p.move(-2,3)
assert p.x == 1
assert p.y == 7


#Exception & Error Handling

try:
    items = ['a','b']
    third = items[2]
    print('This wont print')

except:
    print('got an error')


#When to use try/except
'''
The reason to use try/except is when you have a code block to execute 
that will sometimes run correctly and sometimes not, 
depending on conditions 
you can’t foresee at the time you’re writing the code.

'''


#Handling different exception types
items = ['a','b']

try:
    myvar = a
    x = 10/0
    print('a')
    third = items[2]
except ZeroDivisionError:
    print('you cant divide by zero!')
except IndexError:
    print('Index out of bounds')
    print('something went wrong: assingin to false')
    third = False
except NameError:
    print('Tried to fetch a name that does exist')

print('this does run!')



