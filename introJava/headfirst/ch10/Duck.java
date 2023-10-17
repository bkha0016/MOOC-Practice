/* STATIC VARIABLES ARE SHARED
* ALL INSTANCES OF THE SAME CLASS SHARE A SINGLE COPY OF THE STATIC VARIABLES
* INSTANCE VARIABLES: 1 PER INSANCE
* STATIC VARIABLES: 1 PER CLASS
*/


public class Duck {
    private int size;
    // The static duckCount var is intialized only when the class is first loaded
    // NOT each time a new instance is made
    private static int duckCount = 0;

    // Now it will keep incrementing each time the Duck constructor runs
    // because duckCount is static and wont be reset to 0 
    public Duck() {
        duckCount++;
    }

    public void setSize(int s) {
        size = s;
    }

    public int getSize() {
        return size;
    }

    public int getCount() {
        return duckCount;
    }

    public static void main(String[] args){
        Duck d = new Duck();
        Duck d1 = new Duck();

        System.out.println("The amount of duck in d1 is " + d1.getCount() + " While in d is " + d.getCount());
    }
}
/* 
 *  A Duck object doesnt keep its own copy of duckCount
 *  Because duckCount is static, Duck objects all share a single copy of it
 *  You can think of a static variable as a variable that lives in a CLASS instaead of in an object
 *  Each Duck object has its own size variable, but theres only one copy
 *  of the duckCount varibale-the one in the class.
*/


/*
 * STATIC METHODS CANT USE NON-STATIC (INSTANCE) VARIABLES
 * STATIC METHODS CANT USE NON-STATIC METHODS, EITHER!
 */