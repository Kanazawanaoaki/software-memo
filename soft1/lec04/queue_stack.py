class Queue:
    def __init__(self):
        self.p = []
    def push(self, e):
        self.p = self.p + [e]
    def pop(self):
        ret = self.p[0]
        self.p = self.p[1:]
        return ret
    def is_empty(self):
        return self.p == []

class Stack(Queue):
    def pop(self):
        ret = self.p[-1]
        self.p = self.p[:-1]
        return ret

print('FIFO')
q = Queue()
for e in [2, 7, 4, 1, 6]:
    q.push(e)
while not q.is_empty():
    print q.pop()

print('LIFO')
q = Stack()
for e in [2, 7, 4, 1, 6]:
    q.push(e)
while not q.is_empty():
    print q.pop()
