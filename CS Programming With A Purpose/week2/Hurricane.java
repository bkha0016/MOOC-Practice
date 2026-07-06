package week2;

public class Hurricane {
    public static void main(String[] args) {
        int wind_speed = Integer.parseInt(args[0]);

        if (wind_speed >= 74 && wind_speed <= 95) {
            System.out.println("Category 1");
        }
        else if (wind_speed >= 96 && wind_speed <= 110) {
            System.out.println("Category 2");
        }
        else if (wind_speed >= 111 && wind_speed <= 130) {
            System.out.println("Category 3");
        }
        else if (wind_speed >= 131 && wind_speed <= 155) {
            System.out.println("Category 4");
        }
        else if (wind_speed > 155) {
            System.out.println("Category 5");
        }
        else{
            System.out.println("Error Input!");
        }   
    }
    
}
