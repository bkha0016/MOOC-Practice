import javax.swing.*;
import java.awt.*;
import java.util.concurrent.TimeUnit;


public class SimpleAnimation {
    // Make two instance variables in the main GUI class, for the x and y coordinates of the circle
    private int xPos = 70;
    private int yPos = 70;

    public static void main(String[] args) {
        SimpleAnimation gui = new SimpleAnimation();
        gui.go();
    }

    public void go() {
        JFrame frame = new JFrame();
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        MyDrawPanel drawPanel = new MyDrawPanel();

        // make the widgets and put them into the frame
        frame.getContentPane().add(drawPanel);
        frame.setSize(300, 300);
        frame.setVisible(true);

        for (int i = 0; i < 130; i++) {
            xPos++;
            yPos++;

            drawPanel.repaint(); // tell the panel to repaint itself (so we can see the circle in the new location)

            try {
                TimeUnit.MILLISECONDS.sleep(50);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

    }

    class MyDrawPanel extends JPanel {
        public void paintComponent(Graphics g) {
            g.setColor(Color.white);
            g.fillRect(0, 0, this.getWidth(), this.getHeight());

            g.setColor(Color.green);
            g.fillOval(xPos, yPos, 40, 40);
        }
    }
    
}
