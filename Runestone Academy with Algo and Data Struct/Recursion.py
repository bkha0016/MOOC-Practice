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