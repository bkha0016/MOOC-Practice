public class RandomWalkers {
    public static void main(String[] args) {

        int r = Integer.parseInt(args[0]);
        int trials = Integer.parseInt(args[1]);
        int i = 0;
        double totals = 0.0;
        int steps = 0;
        int x = 0;
        int y = 0;

        while(i != trials){

            while (r != (Math.abs(x) + Math.abs(y))) {
                double probs = Math.random();
                //east and west
                if (probs <= 0.25) {
                    x += 1;
                }
                else if (probs > 0.25 && probs <= 0.50){
                    x -= 1;
                }
                //north & south
                else if (probs > 0.50 && probs <= 0.75){
                    y += 1;
                }
                else{
                    y -= 1;
                }

                steps += 1;

            }
            //reset the counter
            x = 0;
            y = 0;
            i += 1;
            totals = totals + steps;
            steps = 0;
            

        
        }

        Double walk_avg = totals/trials;

        System.out.print("average number of steps = " + walk_avg);

        
    }
    
}
