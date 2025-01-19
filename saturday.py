import random
a = random.sample(range(1,50),5)
b = random.sample(range(1,50),5)

c = [num for num in a if num in b]

print(a)
print(b)
print(c)