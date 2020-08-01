num = [192, 211, 391, 458, 606, 775, 892, 954, 989, 998]
def lsearch(n, data):
    for x in data:
        if x == n:
            return True
    return False

print lsearch(192, num)
print lsearch(193, num)
