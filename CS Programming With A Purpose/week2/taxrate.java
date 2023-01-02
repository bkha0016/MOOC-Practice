package week2;

public class taxrate {
    public static void main(String[] args) {
        int income = Integer.parseInt(args[0]);
        double rate;

        if (income < 47450){
            rate = 0.22;

        }
        else{
            if (income < 114650) {
                rate = 0.25;
                
            }
            else{
                if (income < 174700) {
                    rate = 0.28;
                    
                }
                else{
                    if (income < 311950) {
                        rate = 0.33;
                    }
                    else{
                        rate = 0.35;
                    }
                }
            }
        }
     System.out.println("The current tax rate is " + rate + " %");
        
    }
    
}
