import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;

public class PredictableSleep {
    public static void main(String[] args) {
        ExecutorService executor = Executors.newSingleThreadExecutor();
        executor.execute(() -> sleepThenPrint());
        System.out.println("back in main");
        executor.shutdown();
        
    }

    private static void sleepThenPrint() {
        try {
            TimeUnit.SECONDS.sleep(1); // calling sleep here will force the new thread to leave the currently running state. The main thread will get a chance to print out "back in main"
        } catch(InterruptedException e) {
            e.printStackTrace();
        }

        System.out.println("top o' the stack"); // There will be a pause (for about two seconds) before we get to this line, which prints out "top o' the stack"
    }
    
}
