import java.util.*;
import java.util.stream.*;


public class LimitWithStream {

    public static void main(String[] args) {
        List<String> strings = List.of("I", "am", "a", "list", "of", "Strings");

        Stream<String> stream = strings.stream();
        Stream<String> limit = stream.limit(4);
        long result = limit.count();
        System.out.println("result = " + result);

        // process of chaining
        // collect <- collect the results from stream
        // the Collectors.toList() the class Collectors has a method of toList that changes the elements into a list data structure
        List<String> results = strings.stream()
                                        .sorted((s1, s2) -> s1.compareToIgnoreCase(s2)) // lambda that compares string with another string, in a way that ignores upper or lowercase
                                        .skip(2)
                                        .limit(4)
                                        .collect(Collectors.toList());
        System.out.println("result = " + results);

    }
    
}
