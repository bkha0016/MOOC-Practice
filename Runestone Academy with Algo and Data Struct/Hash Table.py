#Hash Table REVIEW
'''
look up by key is O(1) on average
insertion/deletion is O(1) on average
implementing dictionary but the better version
'''


class HashTable:
    def __init__(self):
        self.MAX = 100
        self.arr = [[] for i in range(self.MAX)]
    
    def get_hash(self,key):
        h = 0
        for char in key:
            h += ord(char)
        return h % self.MAX
    
    def __setitem__(self,key,val):
        #Collusion handling in Hash Table -> chaining process
        h = self.get_hash(key)
        found = False
        for idx, elem in enumerate(self.arr[h]): #index: 0,1 , elem: string or num
            if len(elem) == 2 and elem[0] == key: #element exist & modify key value pair
                self.arr[h][idx] = (key,val)
                found = True
                break  
        if not found:
            self.arr[h].append((key,val))

    def __getitem__(self,key):
        h = self.get_hash(key)
        for element in self.arr[h]:
            if element[0] == key:
                return element[1]
        
        return None

    def __delitem__(self,key):
        h = self.get_hash(key)
        for index,element in enumerate(self.arr[h]):
            if element[0] == key:
                del self.arr[h][index]

      





t = HashTable()
t['march 6'] = 130 #anagram produces the same ord number
print(t.get_hash('march 6'), t.get_hash('6 march'))
t['march 5'] = 69
t['6 march'] = 459
print(t.arr)









