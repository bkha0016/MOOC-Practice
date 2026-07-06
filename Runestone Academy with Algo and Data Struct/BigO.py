#minimm number in a list

def minimum_fast(a):
    min_index = -1
    for i in range(len(a)):
        if min_index == -1 or a[i] < a[min_index]:
            min_index = i

    return a[min_index]

def minimum_naive(a):
    current = 0 
    for x in a:
        for y in a:
            if x < y:
                current = x

    return current 

print(minimum_fast([1,2,3,4,5,6,0,-5]))
print(minimum_naive([1,2,3,4,5,6,0,-5]))


#An Anagram Detection Example:
#BigO = 2n 

def anagram_naive(s1,s2):

    if len(s1) != len(s2):
        return False

    for i in s1:
        if i in s2:
            pass

    for y in s2:
        if y in s1:
            pass
    
    return True

print(anagram_naive('python','nohtyp'))
print(anagram_naive('heart','earth'))

def anagram_fast(s1,s2):

    s_list1 = list(s1)
    s_list2 = list(s2)

    s_list1.sort()
    s_list2.sort()

    for i in range(len(s_list1)):
        if s_list1[i] != s_list2[i]:
            return False
        
    return True

print(anagram_fast('python','nohtyp'))
print(anagram_fast('heart','earth'))
print(anagram_fast('abcd','dcda'))


#find the kth smallest number in list BigO: O(nlog(n))
    
def smallest_num_naive(x):
    
    x.sort()
    s_index = -1
    
    for i in range(len(x)):
        if s_index == -1 or x[i] < x[s_index]:
            s_index = i
    
    return x[s_index]



print(smallest_num_naive([3,4,5,3,7,9,0,2,3,4]))

def smallest_num_fast(x):
    s_index = -1
    
    for i in range(len(x)):
        if s_index == -1 or x[i] < x[s_index]:
            s_index = i
    
    return x[s_index]

print(smallest_num_fast(list(range(500))))
print(smallest_num_naive(list(range(500))))



