public class CartesianToPolar {
    public static void main(String[] args) {
        double x = Double.parseDouble(args[0]);
        double y = Double.parseDouble(args[1]);

        double val = Math.sqrt(x * x + y * y);
        double theta = Math.atan2(y, x);

        System.out.println("r is equal to " + val);
        System.out.println("theta is equal to " + theta);

        

        
    }
    
}
