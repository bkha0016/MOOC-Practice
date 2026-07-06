import java.util.concurrent.*;

public class PredictableLatch {
    public static void main(String[] args) {
        ExecutorService executor = Executors.newSingleThreadExecutor();
        CountDownLatch latch = new CountDownLatch(1); //create a new countDownLatch. This latch lets us wait for the signal

        executor.execute(() -> waitForLatchThenPrint(latch));

        System.out.println("back in main");
        latch.countDown();

        executor.shutdown();


        
    }

    private static void waitForLatchThenPrint(CountDownLatch latch) {
        try {
            // wait for the main thread to print out its message. this thread
            // will be in a non-runnable state whilt its waiting
            latch.await();

        } catch(InterruptedException e) {
            e.printStackTrace();
        }
        System.out.println("top o' the stack");
    }

    
}
