import java.util.*;

public class TestMap {
    public static void main(String[] args) {
        // Hashmap needs two types of parameter one for the key and other for the valye
        Map<String, Integer> scores = new HashMap<>();
        scores.put("Kathy", 42);
        scores.put("Bert", 343); // use put() instead of add(), and now of course it takes two arguments(key, value)
        scores.put("Skyler", 420);

        System.out.println(scores);
        System.out.println(scores.get("Bert")); // The get() method takes a key and returns the value (in this case, an integer)
    }
    
}
