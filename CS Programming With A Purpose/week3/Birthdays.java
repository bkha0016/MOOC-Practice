package week3;

public class Birthdays {
    public static void main(String[] args) {
        int days = Integer.parseInt(args[0]);
        int people = 0;
        int trials = Integer.parseInt(args[1]);

        
        for (int i = 0; i < trials; i++) {
            //hasBirthday[d] = true if someone born on day d; false otherwise
            //auto-initialized to false
            boolean[] hasBirthday = new boolean[days];

            while (true) {
                people++;
                int d = (int) (days * Math.random()); //integer between 0 and days-1
                if (hasBirthday[d]) break;
                hasBirthday[d] = true;

            }
        
    }
    //print out the average
    double average = (double) people / trials;
    System.out.println(average);
    }
    
}
