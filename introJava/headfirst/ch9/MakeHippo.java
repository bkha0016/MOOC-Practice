abstract class Animal {
    private String name; // all animal have names

    // a getter method
    public String getName() {
        return name;
    }

    // a setter method (takes the name and assings it into the name of instance variable)
    public Animal (String theName) {
        name = theName;
    }
}

class Hippo extends Animal {
    // Hippo constructor takes a name
    // it sends the name up the stack to the animal constructor
    public Hippo(String name) {
        super(name);
    }
}

public class MakeHippo {
    public static void main(String[] args) {
        Hippo h = new Hippo("Buffy");
        System.out.println(h.getName());
    }
    
}
