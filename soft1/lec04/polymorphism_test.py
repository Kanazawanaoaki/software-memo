class Vehicle:
    def __init__(self, miles, make, model):
        self.miles = miles
        self.make = make
        self.model = model
        
        def price(self):
            return 5000

class Car(Vehicle):
    def price(self):
        return 8000 - 0.1 * self.miles
    
class Truck(Vehicle):
    def price(self):
        return 10000 - 0.1 * self.miles

acord = Car(0, 'Honda', 'Acord')
giga = Truck(0, 'Isuzu', 'Giga')

for vehicle in [acord,giga]:
    print(vehicle.make, vehicle.model,vehicle.price())
