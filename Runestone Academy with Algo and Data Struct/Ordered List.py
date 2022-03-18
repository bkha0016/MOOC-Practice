#Ordered List Abstract Data type
class OrderedList:
    def __init__(self):
        self.head = None

    def search(self,item):
        current = self.head
        while current is not None:
            if current.data == item:
                return True
            if current.data > item:
                return False
            current = current.next


return False
