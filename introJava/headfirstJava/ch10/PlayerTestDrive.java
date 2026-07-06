// All static variables in a class are initialized before
// any object of that class can be created.

class Player {
    static int playerCount = 0; // the playerCount is intialzed when the class is loaded. We explicitly initialized it to 0, 
    //but we dont need to since 0 is the dfeault value for ints
    private String name;
    public Player(String n) {
        name = n;
        playerCount++;
    }
}

public class PlayerTestDrive {
    public static void main(String[] args) {
        System.out.println(Player.playerCount);
        Player one = new Player("Tiger Woods");
        System.out.println(Player.playerCount); // access a static variable just like a static method - with the class name
    }

}
/* Default values for declared but uninitialized static and instance variables
 * Primitive integers (long, short, etc) : 0
 * Primitive floating points (float, double) : 0.0
 * Boolean : false
 * Object references : null
*/