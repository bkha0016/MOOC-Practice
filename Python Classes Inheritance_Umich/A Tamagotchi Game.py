from random import randrange

class Pet:
    boredom_decrement = 4
    hunger_decrement = 6
    boredom_threshold = 5
    hunger_threshold = 10
    sounds = ['Woof']

    def __init__(self, name = "Kitty"):
        self.name = name
        self.hunger = randrange(self.hunger_threshold)
        self.boredom = randrange(self.boredom_threshold)
        self.sounds = self.sounds[:]

    def clock_tick(self):
        self.boredom += 1
        self.hunger += 1

    def mood(self):
        if self.hunger <= self.hunger_threshold and self.boredom <= self.boredom_threshold:
            return 'happy'
        elif self.hunger > self.hunger_threshold:
            return 'hungry'

        else:
            return 'bored'

    def __str__(self):
        state = "      I'm " + self.name + ".  "
        state += " I feel " + self.mood() + ". "
        return state
    
    def hi(self):
        print(self.sounds[randrange(len(self.sounds))])
        self.reduce_boredom()

    def teach(self,word):
        self.sounds.append(word)
        self.reduce_boredom()

    def feed(self):
        self.reduce_hunger()

    def reduce_boredom(self):
        self.boredom = max(0, self.boredom - self.boredom_decrement)

    def reduce_hunger(self):
        self.hunger = max(0,self.hunger - self.hunger_decrement)


p1 = Pet("Fido")
print(p1)

for i in range(10):
    p1.clock_tick()
    print(p1)

p1.feed()
p1.hi()
p1.teach("Boo")

for i in range(10):
    p1.hi()


print(p1)
p1.teach("lol")
p1.teach('nibba')

print(p1)

for i in range(10):
    p1.hi()


    