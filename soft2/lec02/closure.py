def f():
    counter = 0
    def g():
        nonlocal counter # local to 'f'
        counter = counter + 1
        return counter
    return g

#c = 0
new_g = f()
print(new_g())
print(new_g())
print(new_g())
