class Customer:
    def __init__(self, name, balance):
        self.name = name
        self.balance = balance

    def withdraw(self, amount):
        if amount > self.balance:
            print('Amount greater than balance.')
            return False
        self.balance = self.balance - amount
        return self.balance

    def deposit(self, amount):
        self.balance = self.balance + amount
        return self.balance

## 最初
# class Car:
#     def __init__(self, miles, make, model):
#         self.miles = miles
#         self.make = make
#         self.model = model

#     def price(self):
#         return 8000 - 0.1 * self.miles

# class Truck:
#     def __init__(self, miles, make, model):
#         self.miles = miles
#         self.make = make
#         self.model = model

#     def price(self):
#         return 10000 - 0.1 * self.miles

## オーバーライド
# class Vehicle:
#     def __init__(self, miles, make, model):
#         self.miles = miles
#         self.make = make
#         self.model = model
        
#         def price(self):
#             return 5000

# class Car(Vehicle):
#     def price(self):
#         return 8000 - 0.1 * self.miles
    
# class Truck(Vehicle):
#     def price(self):
#         return 10000 - 0.1 * self.miles

## 別例の定義
class Vehicle(object):
    def __init__(self, miles, make, model):
        self.miles = miles
        self.make = make
        self.model = model
        self.base_price = 0

    def price(self):
        return self.base_price - 0.1 * self.miles

class Car(Vehicle):
    def __init__(self, miles, make, model):
        super(Car, self).__init__(miles, make, model)
        self.base_price = 8000
    
class Truck(Vehicle):
    def __init__(self, miles, make, model):
        super(Truck, self).__init__(miles, make, model)
        self.base_price = 10000    

class SuperCar:

    wheel = 4

    def __init__(self, make, model):
        self.make = make
        self.model = model
