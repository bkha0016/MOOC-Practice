public class Stats5 {
    public static void main(String[] args) {
        double val1 = Math.random();
        double val2 = Math.random();
        double val3 = Math.random();
        double val4 = Math.random();
        double val5 = Math.random();

        double average = (val1 + val2 + val3 + val4 + val5) / 5;
        double min = Math.min(val5, Math.min(val4, Math.min(val3, Math.min(val1, val2))));
        double max = Math.max(val5, Math.max(val4, Math.max(val3, Math.max(val1, val2))));

        System.out.println("average is " + average);
        System.out.println("min value is " + min);
        System.out.println("max value is " + max);


    }
   
    
}
