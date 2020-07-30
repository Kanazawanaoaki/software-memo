num = 0
print(num)
try:
    while True:
        print(num)
        num = num + 1
        if num >= 4:
            raise ValueError("exit loop")
except ValueError as e:
    print(e)
