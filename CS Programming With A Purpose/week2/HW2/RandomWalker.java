public class RandomWalker {
    public static void main(String[] args) {
        int r = Integer.parseInt(args[0]);
        int steps = 0;
        int x = 0;
        int y = 0;

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
            System.out.println("(" + x + ", " + y +")");

            steps += 1;

        }
        System.out.println("steps = " + steps);

        
    }
    
}
