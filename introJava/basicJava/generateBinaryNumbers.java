import java.util.LinkedList;
import java.util.Queue;
import java.util.Arrays;

public class generateBinaryNumbers {

    public String[] generateBinaryNumbers(int n) {
        String[] result = new String[n];
        Queue<String> q = new LinkedList<>();
        q.offer("1");

        for (int i = 0; i < n; i++) {
            result[i] = q.poll();
            String n1 = result[i] + "0";
            String n2 = result[i] + "1";
            q.offer(n1);
            q.offer(n2);
        }

        return result;
        
    }
    public static void main(String[] args) {
        generateBinaryNumbers test1 = new generateBinaryNumbers();
        System.out.println(Arrays.toString(test1.generateBinaryNumbers(25)));
        
    }
    
}
