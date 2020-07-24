import math
f = open('test.dat', 'w')
for i in range(100):
    t = i/10.0
    f.write('{} {}\n'.format(t, math.sin(t)))
f.close()
