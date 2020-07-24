f = open('test.dat', 'r')
l = f.readline()
while l:
    x, y = map(float, l.split())
    print('{} {}'.format(x,y))
    l = f.readline()
f.close()
