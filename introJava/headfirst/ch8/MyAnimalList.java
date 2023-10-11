import javax.sound.midi.SysexMessage;

class MyAnimalList {
    private Animal[] animals = new Animal[5];
    private int nextIndex = 0;

    public void add(Animal a) {
        if (nextIndex < animals.length) {
            animals[nextIndex] = a;
            System.out.println("Animal added at " + nextIndex);
            nextIndex++;
        }
    }

    
}

class Animal{

}

class Dog extends Animal {

}

class Cat extends Animal {

}

class AnimalTestDrive {
    public static void main(String[] args){
        MyAnimalList list = new MyAnimalList();
        Dog dog = new Dog();
        Cat cat = new Cat();
        list.add(dog);
        list.add(cat);

        System.out.println("equals(Object o)"); // check whether two objects are equal or not

        if (dog.equals(cat)) {
            System.out.println("true");
        } else {
            System.out.println("false");
        }

        System.out.println("getClass()"); // gives you back the class that object was instantiated from

        System.out.println(cat.getClass());

        System.out.println("hashCode()"); // prints out a hashcode for the object

        System.out.println(cat.hashCode());

        System.out.println("toString()"); // prints out the string messsage with the name of the class and some other number we rarely care about

        System.out.println(cat.toString());








    }
}
