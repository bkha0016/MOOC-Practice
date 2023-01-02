public class SpringSeasons {

    public static void main(String[] args) 
    {
        int m = Integer.parseInt(args[0]);
        int d = Integer.parseInt(args[1]);
        boolean value;

        //month is between March and June
        value = (m <= 6 && m >= 3);

        //day focus

        value = value && (m >= 3 && d > 20) || (m <= 6 && d < 20); 

        System.out.println(value);




        
    }
    
}
