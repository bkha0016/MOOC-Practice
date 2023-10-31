import java.util.*;

public class MixForLoops {
    public static void main(String[] args) {
        List<Integer> nums = List.of(1, 2, 3, 4, 5);
        String output = "";

        for (Integer num : nums) {
            output += num + " ";
        }

        System.out.println(output);
    }
    
}