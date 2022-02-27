class Pizza:
    def __init__(self, price, size, ingredients):
        self.price = price
        self.size = size
        self.ingredients = ingredients

    def add_ingredient(self, price, ingredient):
        self.price += price
        self.ingredients.append(ingredient)

    def add_size(self, price, size):
        self.price += price
        self.size = size

    def __str__(self):
        ingredient_names = ""
        for i in self.ingredients:
            ingredient_names += f"{i}, "
        ingredient_names = ingredient_names[:-2]

        return f"This pizza costs {self.price} $. It is {self.size} and contains {ingredient_names}."


def size(pizza):
    s = input("What size of pizza would you like to receive (S/M)?")
    if s == "S":
        pizza.add_size(10, "small")
    else:
        pizza.add_size(15, "medium")
    return pizza


def sauce(pizza):
    a = input("Do you want the (T)omato or (M)ayonnaise sauce?")
    if a == "T":
        pizza.add_ingredient(1, "tomato sauce")
    elif a == "M":
        pizza.add_ingredient(1, "mayonnaise")
    return pizza


def meat(pizza):
    a = input("Do you want meat (Y/N)?")
    if a == "Y":
        b = input("Do you want ham (Y/N)?")
        if b == "Y":
            pizza.add_ingredient(2, "ham")
        else:
            c = input("Do you want chicken (Y/N)?")
            if c == "Y":
                pizza.add_ingredient(1, "chicken")
    return pizza


def ingredients(pizza, prices):
    for i in prices:
        a = input(f"Do you want {i} (Y/N)?")
        if a == "Y":
            pizza.add_ingredient(prices[i], i)
    return pizza


ingredient_prices = {"corn": 1, "olives": 2, "pepper": 1, "pineapple": 1, "onions": 1, "tuna": 2.5,
                     "mushrooms": 1, "cheese": 0.5}


def order():
    print("Pizza Restaurant - Submit your order")
    pizza = Pizza(0, "", [])
    pizza = size(pizza)
    pizza = sauce(pizza)
    pizza = meat(pizza)
    pizza = ingredients(pizza, ingredient_prices)
    return pizza


pizza = order()
print(pizza)
