#INCOMPLETE

import json

# Repeatedly asks the user for a number between min & max (inclusive)
def getNumberBetween(prompt, min, max):
    userinp = input(prompt) # ask the first time

    while True:
        try:
            n = int(userinp) # try casting to an integer
            if n < min:
                errmessage = 'Must be at least {}'.format(min)
            elif n > max:
                errmessage = 'Must be at most {}'.format(max)
            else:
                return n
        except ValueError: # The user didn't enter a number
            errmessage = '{} is not a number.'

        # If we haven't gotten a number yet, add the error message
        # and ask again
        userinp = input('{}\n{}'.format(errmessage, prompt))

# Spins the wheel of fortune wheel to give a random prize
# Examples:
#    { "type": "cash", "text": "$950", "value": 950, "prize": "A trip to Ann Arbor!" },
#    { "type": "bankrupt", "text": "Bankrupt", "prize": false },
#    { "type": "loseturn", "text": "Lose a turn", "prize": false }
def spinWheel():
    with open("wheel.json", 'r') as f:
        wheel = json.loads(f.read())
        return random.choice(wheel)

# Returns a category & phrase (as a tuple) to guess
# Example:
#     ("Artist & Song", "Whitney Houston's I Will Always Love You")
def getRandomCategoryAndPhrase():
    with open("phrases.json", 'r') as f:
        phrases = json.loads(f.read())

        category = random.choice(list(phrases.keys()))
        phrase   = random.choice(phrases[category])
        return (category, phrase.upper())

# Given a phrase and a list of guessed letters, returns an obscured version
# Example:
#     guessed: ['L', 'B', 'E', 'R', 'N', 'P', 'K', 'X', 'Z']
#     phrase:  "GLACIER NATIONAL PARK"
#     returns> "_L___ER N____N_L P_RK"
def obscurePhrase(phrase, guessed):
    rv = ''
    for s in phrase:
        if (s in LETTERS) and (s not in guessed):
            rv = rv+'_'
        else:
            rv = rv+s
    return rv

# Returns a string representing the current state of the game
def showBoard(category, obscuredPhrase, guessed):
    return """
Category: {}
Phrase:   {}
Guessed:  {}""".format(category, obscuredPhrase, ', '.join(sorted(guessed)))



class WOFPlayer():
    def __init__(self,name,prizeMoney = 0,prizes = list()):
        self.name = name
        self.prizeMoney = prizeMoney
        self.prizes = prizes

    def addMoney(self,amt):
        self.prizeMoney += amt

    def goBankrupt(self):
        self.prizeMoney = 0 
    
    def addPrize(self,prize):
        self.prizes.append(prize)

    def __str__(self):
        return '{} (${})'.format(self.name, self.prizeMoney)

    
class WOFHumanPlayer(WOFPlayer):
    def getMove(self, category, obscuredPhrase, guessed):
        print('{} has ${}\n Category: {}\n Phrase: {}\n Guessed: {}\n Guess a letter, phrase, or type "exit" or "pass": '.format(self.name,self.prizeMoney,category,obscuredPhrase,guessed))

        inp_game = input('Guess a letter, phrase, or type "exit" or "pass"')

        return inp_game

class WOFComputerPlyaer(WOFPlayer):
    SORTED_FREQUENCIES = 'ZQXJKVBPYGFWMUCLDRHSNIOATE'

    def __init__(self,name,difficulty):
        WOFPlayer.__init__(self,name,prizes=list(),prizeMoney=0)
        self.difficulty = difficulty

    def smartCoinFlip(self):
        num = random.randint(1,10)

        if num > self.difficulty:
            return True

        else:
            return False

    def getPossibleLetters(self,guessed):
        guess = list()
        for l in LETTERS:
            if l not in guessed and l in VOWELS:
                guess.append(l)
            elif l not in guessed and l in VOWELS:







