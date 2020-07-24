class Rat: # rational number
    n = 0 # numerator
    d = 0 # denominator

    def __init__(self, n, d):
        self.n = n
        self.d = d

    def __repr__(self):
        return '{}/{}'.format(self.n, self.d)

    def __add__(self, other):
        return Rat((self.n * other.d) + (other.n * self.d), self.d * other.d)
    

one_half = Rat(1,2)
one_third = Rat(1,3)
# print one_half
# print one_third

# ret = Rat((one_half.n * one_third.d) + (one_third.n * one_half.d), one_half.d * one_third.d)
# print ret
