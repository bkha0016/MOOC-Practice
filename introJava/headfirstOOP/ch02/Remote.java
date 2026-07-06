import java.util.Timer;
import java.util.TimerTask;

public class Remote {
    private DogDoor door;

    public Remote(DogDoor door) {
        this.door = door;
    }

    public void pressButton() {
        System.out.println("Pressing the remote control button...");
        if (door.isOpen()) {
            door.open();
        } else {
            door.close();
        }

        // A new timer that schedule the dog door closing
        // Tells the timer how long to wait before executing the task
        // we're watiting 5 seconds which is 5000 milliseconds

        final Timer timer = new Timer();
        timer.schedule(new TimerTask() {
            public void run() {
                door.close();
                timer.cancel();
            }
        }, 5000);
    }

}