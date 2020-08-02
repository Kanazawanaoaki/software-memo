num = [192, 211, 391, 458, 606, 775, 892, 954, 989, 998]
def lsearch(n, data):
    for x in data:
        if x == n:
            return True
    return False

def hsearch(n, data):
    h = n%10
    if not hash_table.has_key(h):
        return False
    return lsearch(n, hash_table[h])

hash_table = {}
def make_hash(num):
    for n in num:
        h = n%10
        if not hash_table.has_key(h):
            hash_table[h] = []
        hash_table[h].append(n)

make_hash(num)
print hsearch(192, num)
print hsearch(193, num)
