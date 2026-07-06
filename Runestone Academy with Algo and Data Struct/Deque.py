#Deque Abstract Data Type

class Deque:
    """Deque implementation as a list"""

    def __init__(self):
        """Create new deque"""
        self._items = []

    def is_empty(self):
        """Check if the deque is empty"""
        return not bool(self._items)

    def add_front(self, item):
        """Add an item to the front of the deque"""
        self._items.append(item)

    def add_rear(self, item):
        """Add an item to the rear of the deque"""
        self._items.insert(0, item)

    def remove_front(self):
        """Remove an item from the front of the deque"""
        return self._items.pop()

    def remove_rear(self):
        """Remove an item from the rear of the deque"""
        return self._items.pop(0)

    def size(self):
        """Get the number of items in the deque"""
        return len(self._items)



#Palindrome checker

def palindrome(string):
    check = Deque()

    for char in string:
        check.add_rear(char)
    
    print(check._items)
    for i in range(len(check._items)):
        if check.size() == 1:
            return True
        elif check.remove_rear() == check.remove_front():
            pass
            print(check._items)
        else:
            return False



print(palindrome('radar'))
print(palindrome('lsdkjfskf'))
