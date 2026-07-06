#simplest form of searching

from cgi import test

'''
print(15 in [3,5,2,4,1])
print(3 in [3,5,2,4,1])
'''

#seqeuential search

def sequential_search(a_list, item):
    pos = 0

    while pos < len(a_list):
        if a_list[pos] == item:
            return True
        else:
            pos += 1

    return False

'''
test_list = [1, 2, 32, 8, 17, 19, 42, 13, 0]
print(sequential_search(test_list,32))
print(sequential_search(test_list,-3))
'''

def ordered_sequential_search(a_list,item):
    pos = 0
    while pos < len(a_list):
        if a_list[pos] == item:
            return True
        else:
            if a_list[pos] > item:
                return False
            else:
                pos += 1
    
    return False

'''
test_list.sort()
print(test_list)
print(ordered_sequential_search(test_list, 298329))
'''

def binary_search(a_list,item):
    first = 0
    last = len(a_list) - 1

    while first <= last:
        mid = (first+last)//2
        if a_list[mid] == item:
            return True
        elif a_list[mid] < item:
            first = mid + 1
        elif a_list[mid] > item:
            last = mid - 1
        else:
            pass
    return False


#print(binary_search(test_list,8))


def binary_search_rec(a_list, item):
    if len(a_list) == 0:
        return False
    else:
        mid = len(a_list)//2
        if a_list[mid] == item:
            return True

        elif item < a_list[mid]:
            return binary_search_rec(a_list[:mid], item)
        
        else: #item > a_list[mid]
            return binary_search_rec(a_list[mid+1:], item)


#HASHING
'''building a data structure that can be searched in O(1) time'''

#Testing concepts of hash table
hash_table = [None] * 11

def h(item):
    return item%11

def put(item):
    hash_table[h(item)] = item

def contains(item):
    return hash_table[h(item)] == item


#add 6 numbers
put(54)
put(26)
put(93)
put(17)
put(77)
put(31)
put(22)
'''
print(hash_table)

print('contains(22): ', contains(22))
print('contains(17): ', contains(17))
print('contains(77): ', contains(77))

'''
#Non-perfect hash functions
#foldings -> taking a digits & divide them into groups
#the mid square methods -> square the number & take the middle digtis
#string data -> use ord() function
'''
def strToNum(s):
    sum = 0
    for c in s:
        sum += ord(c)

    return sum
'''

#will be faster due to recursion
def strToNum(s):
    if len(s) == 1:
        return ord(s[0])
    
    
    return strToNum(s[1:]) + ord(s[0])

def h_str(s): return strToNum(s) % 11

print(strToNum('abcdefg'))

#avoid anagrams
def strToWeightNum(s):
    sum = 0
    for i in range(len(s)):
        sum += (i+1) * ord(s[i])

    return sum

'''
def strToWeightNum_rec(s):
    if len(s) == 1:
        return ord(s[0])
    
    return strToWeightNum_rec(s[1:]) + (ord(s[0]) * (len(s) - len(s[1:])) 
'''

print(strToWeightNum('abcd'))
print(strToWeightNum('dcba')) 


'''
Collision & Resolution:
when you try to put two items in the same slot, then
if you have a systematic method to add the item to the hash table

collision resolution techniques:
open addressing types: (data in table)
-linear probing
-rehashing
-quadratic probing

chaining (data stored not in the table)
'''


#MAP ADT & hash table implementation

class HashTable:
    def __init__(self):
        self.size = 11
        self.slots = [None] * self.size
        self.data = [None] * self.size

    def put(self,key,data):
        hash_value = self.hash_function(key,len(self.slots))
        
        if self.slots[hash_value] is None:
            self.slots[hash_value] = key
            self.data[hash_value] = data
        else:
            if self.slots[hash_value] == key:
                self.data[hash_value] = data  # replace
            else:
                next_slot = self.rehash(hash_value, len(self.slots))
                while (
                    self.slots[next_slot] is not None
                    and self.slots[next_slot] != key
                ):
                    next_slot = self.rehash(next_slot, len(self.slots))

                if self.slots[next_slot] is None:
                    self.slots[next_slot] = key
                    self.data[next_slot] = data
                else:
                    self.data[next_slot] = data

    def get(self, key):
        start_slot = self.hash_function(key, len(self.slots))

        position = start_slot
        while self.slots[position] is not None:
            if self.slots[position] == key:
                return self.data[position]
            else:
                position = self.rehash(position, len(self.slots))
                if position == start_slot:
                    return None

    def __getitem__(self, key):
        return self.get(key)

    def __setitem__(self, key, data):
        self.put(key, data)

    def hash_function(self,key,size):
        return key % size

    def rehash(self,old_hash,size):
        return (old_hash + 1) % size


