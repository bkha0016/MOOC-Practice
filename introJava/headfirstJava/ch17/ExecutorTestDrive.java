import java.util.*;
import java.util.concurrent.*;

public class ExecutorTestDrive {
    public static void main(String[] args) {
        ExcecutorService executor = Executors.newSingleThreadExecutor();

        executor.execute(() -> System.out.println("top o' the stack"));

        System.out.println("back in main");
        executor.shutdown();
    }
}