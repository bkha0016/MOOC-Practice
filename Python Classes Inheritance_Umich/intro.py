"""
Keywords: Classes, objects, instance variable, __init__ variables

classes: good for organizational methodology programming
objects: calls the class through instaniation
need to setup __init__ everytime
"""


class Animal:
    def __init__(self, arms, legs):
        self.arms = arms
        self.legs = legs
        
    def limbs(self):
        return self.arms + self.legs

    
    
    

spider = Animal(4,4)
spidlimbs=spider.limbs()

#print(spider.arms, spider.legs)
#print(spidlimbs)



"""
Using object instance from another variable
In other words, using two object instances

"""

import math
from tkinter.font import names

class Point:
    """ Point class for representing and manipulating x,y coordinates. """

    def __init__(self, initX, initY):

        self.x = initX
        self.y = initY

    def getX(self):
        return self.x

    def allX(self,point2):
        return point2.getX(), self.x

    def getY(self):
        return self.y

    def distanceFromOrigin(self):
        return ((self.x ** 2) + (self.y ** 2)) ** 0.5

    def distance(self, point2):
        xdiff = point2.getX()-self.getX()
        ydiff = point2.getY()-self.getY()

        dist = math.sqrt(xdiff**2 + ydiff**2)
        return dist


q = Point(3,5)
p = Point(7,8)


#print(q.allX(p))
#print(q.distance(p))



"""
Another practice for OOP
"""

class Cereal:
    
    def __init__(self,name,brand,fiber):
        self.name = name
        self.brand = brand
        self.fiber = fiber
        
        
    def __str__(self):
        return "{} cereal is produced by {} and has {} grams of fiber in every serving!".format(self.name,self.brand,self.fiber)
    
    

c1 = Cereal("Corn Flakes", "Kellogg's", 2)
c2 = Cereal("Honey Nut Cheerios", "General Mills", 3)


#print(c1,c2)


#User defined classes

class Point:
    """ Point class for representing and manipulating x,y coordinates. """
    #this is for class variables

    hello = 'aba'

    def __init__(self,x,y): #method of the class, constructor (__init__) a special method

        self.x = x 
        self.y = y
    def get_X(self):
        return self.x
    def get_Y(self):
        return self.y

    def __str__(self): #special method of the class
        return "Point ({},{})".format(self.x,self.y)
    
    def __add__(self,point2):
        new_x = self.x + point2.x
        new_y = self.y + point2.y

        return "Point ({},{})".format(new_x,new_y)

    def __sub__ (self,point2):
        new_x = self.x - point2.x
        new_y = self.y - point2.y

        return "Point ({},{})".format(new_x,new_y)

    def halfway(self,point2):
        mx = (self.x+point2.x)/2
        my = (self.y+point2.y)/2

        return Point(mx,my)




p1 = Point(-5,10)
p2 = Point(15,20)

print(p1.hello)
print(p1,p2)
print(p1+p2)
print(p1-p2)

mid = p1.halfway(p2)
print(mid)
print(mid.get_X())
print(mid.get_Y())

'''
p = Point()         # Instantiate an object of type Point
q = Point()         # and make a second point
print(p is q)
'''


#Creating Instances from Data

cityNames = ['Detroit', 'Ann Arbor', 'Pitssburgh', 'Mars', 'New York']
populations = [680250,117070,304391,1683,8406000]
states = ['MI','MI','PA','PA','NY']

city_tuples = zip(cityNames,populations,states)

print(list(city_tuples))




class City:
    def __init__(self,n,p,s):
        self.name = n
        self.population = p
        self.states = s

    def __str__(self):
        return 'city:{}, populations:{}, states:{}'.format(self.name,self.population,self.states)


cities = list()
for city_tup in city_tuples:
    name,pop,state = city_tup #assing the variables
    city = City(name, pop, state) #instance of class city
    cities.append(city)



#Sorting List of Instances

class Fruit:
    def __init__ (self,name,price):
        self.name = name
        self.price = price

    def sort_priority(self):
        return self.price






L = [Fruit('Cherry', 10),Fruit('Apple', 5),Fruit('BlueBerry', 20)]

for fruit in sorted(L, key = Fruit.sort_priority):   #sort based on self.price
    print(fruit.name)

   


