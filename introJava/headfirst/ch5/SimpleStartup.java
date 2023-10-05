import java.util.Random;
import java.util.Scanner;

/* 
 * Declare an int array to hold the location cells. Call it locationCells
 * Declare an int to hold the number of hits. Call it numOfHits and SET it to 0
 * Declare checkYourself() a method that takes a int for the user's guess. Check it
 * and returns a result representing a hit, miss, or kill
 * Declare a setLocationCells() setter method that takes int array
 * 
 * Method: String checkYourself(int userGuess)
 * Method: void setLocationCells(int[] cellLocations)
 *  GET the cell locations as an int array parameters
 *  ASSIGN the cell locations parameter to the cell locations instance variable
 * END METHOD
*/

public class SimpleStartup {
    private int[] locationCells;
    private int numOfHits = 0;

    public void setLocationCells(int[] locs) {
        locationCells = locs;
    }

    public String checkYourself(int guess){
        String result = "miss";

        for (int cell : locationCells) {
            if (guess == cell) {
                result = "hit";
                numOfHits++;
                break;
            }
        }

        if (numOfHits == locationCells.length) {
            result = "kill";
        }
        
        System.out.println(result);
        return result;
    }

    public int getUserInput(String prompt) {
        System.out.print(prompt + ": ");
        Scanner scanner = new Scanner(System.in);
        return scanner.nextInt();
    }
}

class SimpleStartupGame {

    public static void main(String[] args) {
        // DECLARE an int variable to hold the number of user guesses and set it to 0
        int numOfGuesses = 0;
        // MAKE a new SimpleStartup instance
        SimpleStartup newGame = new SimpleStartup();
        // COMPUTE a random number between 0 and 4 that will be starting the location cell position
        Random random = new Random();

        int randomNum = random.nextInt(4);
        int[] randomArr = {randomNum, randomNum + 1, randomNum + 2};

        // invoke the setLocationCells() method on the SimpleStartup instance
        newGame.setLocationCells(randomArr);

        // declare a boolean variable representing the state of the game, named isAlive. SET is to true
        boolean isAlive = true;

        while (isAlive) {

            int guess = newGame.getUserInput("enter a number");
            String result = newGame.checkYourself(guess);

            numOfGuesses++;

            if (result.equals("kill")) {
                isAlive = false;
                System.out.println("You took " + numOfGuesses + " guesses");
            }



        }
    
}



}



class SimpleStartupTestDrive {
    public static void main(String[] args){
        SimpleStartup dot = new SimpleStartup(); // initiate the object

        int[] locations = {2, 3, 4}; //make an int array for the location of the startup (3 consecutive ints out of a possible 7)
        dot.setLocationCells(locations); // setter method for the startup location

        int userGuess = 2;
        String result = dot.checkYourself(userGuess); // invoke this method to checkt this fake guess

        String testResult = "failed";

        if (result.equals("hit")) {
            testResult = "passed";
        }

        System.out.println(testResult); // print out the test result (passed or failed)
    
    }   
}

