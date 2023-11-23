class Dog{
    // instance variables or knows
    int size;
    String breed;
    String name;

    // method or do of this class
    // void returns nothing
    void bark() {
        System.out.println("Ruff! Ruff!");
    }
}


class DogTestDrive {
    public static void main(String[] args) {
        Dog d = new Dog(); // make a dog object
        d.size = 40; // use the dot operator to set the size of the dog
        d.bark(); // and to call its bark() method
    }
}
