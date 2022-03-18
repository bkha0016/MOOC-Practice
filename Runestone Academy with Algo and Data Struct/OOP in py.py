class Fraction():
    def __init__(self,top,bottom):
        self.num = top
        self.den = bottom

    def __add__ (self, obj2):
        new_num = self.num + obj2.num
        new_den = self.den + obj2.den

        return "{} / {}".format(new_num, new_den)

    def __mul__(self,obj2):
        new_num = self.num * obj2.num
        new_den = self.den * obj2.den

        return "{} / {}".format(new_num, new_den)

    def __truediv__(self,obj2):
        new_num = self.num * obj2.den
        new_den = self.den * obj2.num

        return "{} / {}".format(new_num, new_den)

    def __sub__(self,obj2):
        new_num = self.num - obj2.num
        new_den = self.den - obj2.den

        return "{} / {}".format(new_num, new_den)


    def __str__(self):
        return "{} / {}".format(self.num, self.den)

    def __eq__(self,obj2):
        first_num = self.num * obj2.num
        second_num = self.den * obj2.den

        return first_num == second_num




num1 = Fraction(3,5)
num2 = Fraction(5,8)
print(num1 + num2)
print(num1*num2)
print(num1 / num2)
print(num1==num2)

class LogicGate():
    def __init__(self,lbl):
        self.label = lbl
        self.output = None

    def get_label(self):
        return self.label

    def get_output(self):
        self.output = self.perform_gate_logic()
        return self.output



class BinaryGate(LogicGate):
    def __init__(self,lbl):
        LogicGate.__init__(self,lbl)
        self.pin_a = None
        self.pin_b = None
    
    def get_pin_a(self):
        return int(input('Enter pin A input for gate' + self.get_label() + ' '))

    def get_pin_b(self):
        return int(input('Enter pin B input for gate {} '.format(self.get_label())))


class UnaryGate(LogicGate):
    def __init__(self,lbl):
        LogicGate.__init__(self,lbl)
        self.pin = None

    def get_pin(self):
        return int(input('Enter pin input for gate {}'.format(self.get_label())))



class AndGate(BinaryGate):
    def __init__(self,lbl):
        super().__init__(lbl)

    def perform_gate_logic(self):
        a = self.get_pin_a()
        b = self.get_pin_b()

        if a == 1 and b == 1:
            return 1
        else:
            return 0



#g1 = AndGate('G1')
#print(g1.get_output())


#Class hierarcy for people on a college campus

class Person():
    def __init__(self,salary,job):
        self.salary = salary
        self.job = job
    
    def get_salary(self):
        return self.salary
    
    def get_job(self):
        return self.job


class Teacher(Person):
    def __init__(self,salary,job,faculty,name):
        Person.__init__(self,salary,job)
        self.faculty = faculty
        self.name = name

    def get_faculty(self):
        return self.faculty

    def __str__(self):
        return 'name: {} faculty: {} Job: {} Salary: {}'.format(self.name,self.faculty, self.job, self.salary)


class Student(Person):
    def __init__(self,salary,job,major,name):
        Person.__init__(self,salary,job)
        self.major = major
        self.name = name

    def get_major(self):
        return self.major

    def __str__(self):
        return 'name: {} major: {} Job: {} Salary: {}'.format(self.name,self.major, self.job, self.salary)


s1 = Student(2000,'student','biology','bob')

print(s1)



        
    
    
