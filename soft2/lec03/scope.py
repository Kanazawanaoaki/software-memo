x = 10
print(x)
def foo():
    print(x)
foo()
def bar(z):
    x = 1
    y = 1
    return x + y + z
print bar(10)
def bar2(z):
    y = 1
    return x + y + z
print bar2(10)
