import sys

def absolute(x):
    if x < 0:
        return -x
    else:
        return x

def good_enough(func, guess):
    return absolute(func(guess)) < 0.0001

def improve(func, func_, guess):
    func_(guess) == 0.0 and sys.exit(1)
    return guess - func(guess)/func_(guess)

def my_solve(func, func_, guess):
    while not good_enough(func, guess):
        print "%.2f"%guess
        guess = improve(func, func_, guess)
    return guess


'''

blank c

'''

if __name__ == '__main__':
    a = my_solve(f, f_, 1.0)
    print "%.2f"%a
