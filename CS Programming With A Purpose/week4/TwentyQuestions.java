public class TwentyQuestions {
    public static void main(String[] args) {
        // make a secret number
        int secret = 1 + (int) (Math.random() * 1000000);
        int guess = 0;
        int counter = 0;

        // info about the game
        StdOut.println("A guessing game");
        StdOut.println("A Number Between 1 to 1,000,000");


        // control flow by looping the iterations
        while (secret != guess) {
            guess = StdIn.readInt();
            if (guess < secret) {
                StdOut.println("too low!");
                if (guess == -1) {
                    StdOut.println("The secret number is " + secret);
                }
            }
            else if (guess > secret) {
                StdOut.println("too high!");

            }
            else {
                StdOut.println("Congrats!");
                break;
            }

            counter += 1;

        }

        // summary of the results
        StdOut.println("The Secret Number is " + secret);
        StdOut.println("It takes you " + counter + " tries");

    }
}
