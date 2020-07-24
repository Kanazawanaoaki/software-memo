class SuperCar:

    wheel = 4

    def __init__(self, make, model):
        self.make = make
        self.model = model

    @classmethod
    def get_wheel(cls):
        return cls.wheel
    
nsx = SuperCar('Honda', 'NSX')
dino = SuperCar('Ferrari', 'Dino')

nsx.wheel = 1
print('nsx: {}, dino {}'.format(nsx.wheel, dino.wheel))
print('nsx: {}, dino {}'.format(nsx.get_wheel(), dino.get_wheel()))
