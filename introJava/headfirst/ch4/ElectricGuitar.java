/* Think about this idea of using our remote control
 * control to make direct change to the Cat object's size instance variable
 * In the hands of the wrong person, a reference variable is quite a dangerous weapons
 * This would be a bad thing. We need to build setter methods for all the instance variables,
 * and find a way to force other code to call the setters rather than access the data directly
 * Mark instance variables private
 * Mark getters and setters public
 */


public class ElectricGuitar {
    String brand;
    int numOfPickups;
    boolean rockStarUsesIt;

    String getBrand() {
        return brand;
    }

    void setBrand(String aBrand) {
        brand = aBrand;
    }

    int getNumOfPickups() {
        return numOfPickups;
    }

    void setNumOfPickups(int num) {
        numOfPickups = num;
    }

    boolean getRockStarUsesIt() {
        return rockStarUsesIt;
    }

    void setRockStarUsesIt(boolean yesOrNo) {
        rockStarUsesIt = yesOrNo;
    }
    
}
