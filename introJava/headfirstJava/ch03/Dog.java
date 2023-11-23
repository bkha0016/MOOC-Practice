class Dog {
    String name;

    void bark() {
        System.out.println(name + " says Ruff!");
    }

    void eat() {

    }

    void chaseCat() {

    }

    public static void main (String[] args) {
        // make a Dog object and access it
        Dog dog1 = new Dog();
        dog1.bark();
        dog1.name = "Bart";

        // Now make a dog array
        Dog[] myDogs = new Dog[3];
        //put some dogs on it
        myDogs[0] = new Dog();
        myDogs[1] = new Dog();
        myDogs[2] = dog1;

        // access the dogs name using the array references
        myDogs[0].name = "Fred";
        myDogs[1].name = "Bob";

        // What is myDogs[2] name?
        System.out.println("last dog's name is ");
        System.out.println(myDogs[2].name);

        // loop through the array and tells the dog to bark
        int x = 0;
        while (x < myDogs.length) {
            myDogs[x].bark();
            x = x + 1;
        }

    }
    
}
