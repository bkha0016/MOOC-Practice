'''
Why are we using linked list compared than arraylist?
- its faster using linked list
- SPEED is the key here

A unordered (unsorted) list is a:
-collection of items
-each item hold a rel positiion rel to other items
-the list has a 1st item, a 2nd item
-we can refer to both the frist & last item of a list

consider: #linked list structure
a = ['a',['b'['c', None]]]
'''
#Node Class Simple Form

class Node():
    def __init__(self,data):
        self.data = data
        self.next = None

first = Node('a')
#print(first.data)
#print(first.next)

first.next = Node('b')
#print(first.next.data)
#print(first.next.next)

first.next.next = Node('c')
#print(first.next.next.data)
#print(first.next.next.next)

#Node Class Full Form
class FNode():
    def __init__(self,data):
        self.data = data
        self.next = None
    def getData(self):
        return self.data
    def getNext(self):
        return self.next
    def setData(self,newdata):
        self.data = newdata
    def setNext(self,newnext):
        self.next =newnext

'''
first = FNode('1')
print(first.getData(),first.getNext())
first.setData(88)
print(first.getData(),first.getNext())
first.setNext(FNode('B'))
print(first.getData(),first.getNext())
'''

class UnorderedList:
    def __init__(self):
        self.head = None
    def isEmpty(self):
        return self.head == None
    def add(self,item):
        temp = FNode(item)
        temp.setNext(self.head)
        self.head = temp

    def size(self):
        current = self.head
        count = 0 
        while current != None:
            count += 1
            current = current.getNext()
        
        return count

    def search(self,item):
        current = self.head

        while current != None:
            if current.getData() == item:
                return True
            
            current = current.getNext()
        
        return False

    def indexing(self,i):
        current = self.head
        count = 0

        while current != None:
            if count == i:
                return current.getData()
            
            count += 1
            current = current.getNext()

        return False

    def remove(self,item):
        current = self.head
        previous = None

        while current is not None: #traverse the list until the item we're looking for
            if current.getData() == item:
                break
            previous = current #travel one node behind current
            current = current.getNext() #travel one node ahead previous
        
        if current is None: #if we cannot find it then it returns error
            raise ValueError('{} is not  in the list'.format(item))
        if previous is None: #if the previous node is empty then we place self.head to the next node
            self.head = current.getNext() #is self.head the same thing as current?

        else:
            previous.next = current.getNext() #placing the previous to the next of the current value if we able to find


    def append(self,item):
        current = self.head

        while current.getNext() is not None:
            current = current.getNext()
        
        current.setNext(FNode(item))

    def pop(self):
        current = self.head
        previous = None

        while current.getNext() is not None:
            previous = current
            current = current.getNext()

        previous.next = current.getNext()

    def replace(self,index,item):

        current = self.head
        count = 0

        while current.getNext() is not None:
            if count == index:
                current.setData(item)
                return True

            count += 1
            current = current.getNext()
        
        return False
    
    def push(self,item):

        previous = FNode(item)
        #placing previous.next pointing to the previous head
        previous.next = self.head
        #placing previous as the new head
        self.head = previous

    def insertAfter(self, previous, item):
        if previous is None:
            return False

        current = FNode(item)

        current.next = previous.next

        previous.next = current.next
        
        

    def __str__(self):
        current = self.head
        disp = list()

        while current.getNext() is not None:
            disp.append(current.getData())

            current = current.getNext()

        return 'here: {}'.format(disp)

            
        


'''
t = UnorderedList()
t.add(54)
t.add(32)
t.add(69)
print('====================')

print(t.indexing(0))
print(t.size())
print(t.search(54))
print(t.search(12))

print(t.indexing(2))
print(t.append(33))
print(t.indexing(3))


print(t.size())
print(t.indexing(0), t.indexing(1))
 
print(t.indexing(0))

t.push(5)
print(t.size())
print(t)
t.replace(0,58)

print(t)



'''    
#Ordered List Abstract Data Type

class OrderedList:
    def __init__(self):
        self.head = None
    def is_empty(self):
        return self.head == None
    
    def size(self):

        current = self.head
        count = 0

        while current is not None:
            current = current.getNext()
            count += 1
            

        return count

    def search(self,item):
        current = self.head

        while current is not None:
            if current.getData() == item:
                return True
            if current.getData() > item:
                return False

            current = current.getNext()

        return False

    def add(self,item):
        #add a new node
        current = self.head
        previous = None
        temp = FNode(item)

        while current is not None and current.getData() < item:
            previous = current 
            current = current.getNext()

        if previous is None:
            temp.next = self.head
            self.head = temp
        else:
            temp.next = current
            previous.next = temp


    def remove(self,item):
        current = self.head
        previous = None

        while current is not None:
            if current.getData() == item:
                break
            previous = current
            current = current.getNext()

        if current is None:
            raise ValueError('{} is not in the list'.format(item))

        if previous is None:
            self.head = current.getNext()

        else:
            previous.next = current.getNext()


t = OrderedList()

t.add(1)
t.add(-3)
t.add(5)

print(t.size())




