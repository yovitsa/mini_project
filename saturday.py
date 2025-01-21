# import random
# a = random.sample(range(1,50),5)
# b = random.sample(range(1,50),5)

# c = [num for num in a if num in b]

# print(a)
# print(b)
# print(c)

# def is_prime(number):
#     if number <= 1:
#         return 'Not Prime number'
#     for num in range(2, int(number ** 0.5)+1):
#         if number % 1 == 0:
#             return 'Not a prime'
#     return 'Prime Number'
    
# print(is_prime(724))

import random

# b = random.sample(range(1,30), 7)

def first_and_last(a_list):
    
    return [a_list[0], a_list[len(a_list) -1]]

print(first_and_last(a_list = random.sample(range(1,30),29)))