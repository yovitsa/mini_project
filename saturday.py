# import random
# a = random.sample(range(1,50),5)
# b = random.sample(range(1,50),5)

# c = [num for num in a if num in b]

# print(a)
# print(b)
# print(c)

def is_prime(number):
    if number <= 1:
        return 'Not Prime number'
    for num in range(2, int(number ** 0.5)+1):
        if number % 1 == 0:
            return 'Not a prime'
    return 'Prime Number'
    
print(is_prime(724))
