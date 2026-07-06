package week2;
//converts a day of the week (0 to 6) to the corr name (Sunday to Saturday)
public class NameOfDay {
    public static void main(String[] args) {
        int day = Integer.parseInt(args[0]);

        switch (day){

            case 0: System.out.println("Sunday"); break;
            case 1: System.out.println("Monday"); break;
            case 2: System.out.println("Tuesday"); break;
            case 3: System.out.println("Wednesday"); break;
            case 4: System.out.println("Thursday"); break;
            case 5: System.out.println("Friday"); break;
            case 6: System.out.println("Saturday"); break;
        }
        
    }
    
}
