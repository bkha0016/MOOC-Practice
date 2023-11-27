public class ThreadTestDrive {
    public static void main(String[] args) {
        Thread myThread = new Thread(() -> 
        System.out.println("top o' the stack"));
        myThread.start();
        System.out.println("back in main");
    }
    
}
