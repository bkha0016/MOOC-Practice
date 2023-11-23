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
/* 
 * Interface methods are implicitly public and abstract
 * So typing in public and abstract is optional in fact its not considered good style
 * to type the words in, but we did here just to reinforce it 
*/

// you say 'interface' instead of 'class' here
interface Pet {
    public abstract void beFriendly(); // they have NO body!
    public abstract void play(); // all interface methods are abstract so they must end in semicolons. Remember, they have no body!
} 

class Animal{
    // For the superclass its fine to have a roam and eat that can be overriden later
    public void roam() {}

    public void eat() {}
}

// Dog is-a Animal & Dog is-a Pet
class Dog extends Animal implements Pet {
    // you must implement the pet methods, its your contract
    // notice the curly braces instead of semicolons
    public void beFriendly() {

    }

    public void play() {

    }

    public void roam() {} // normal overriding methods

    public void eat() {}

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
