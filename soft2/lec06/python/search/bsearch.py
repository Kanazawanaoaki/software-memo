num = [192, 211, 391, 458, 606, 775, 892, 954, 989, 998]
def bsearch(n, data):
    low = 0
    high = len(data) - 1
    while low <= high:
        middle = (low + high) /2
        if n == data[middle]:
            return True
        elif n > data[middle]:
            low = middle + 1
        else:
            high = middle - 1
    return False

print bsearch(192, num)
print bsearch(193, num)
