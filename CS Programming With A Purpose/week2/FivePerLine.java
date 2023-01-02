package week2;

public class FivePerLine {
    //prints the integer from 1000 to 2000 with five integers per line
    public static void main(String[] args) {
        for (int i = 1000; i <= 2000; i++) {
            //if the number is not divisibel by 5 then prints
            if (i % 5 != 0) {
                System.out.print(i + " ");
                
            }

            else{
                System.out.print(i);
                System.out.println();

            }
            
        }

        
    }
    
}
