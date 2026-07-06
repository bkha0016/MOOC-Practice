import javax.swing.*;

public class introGUI {

    public static void main(String[] args) {
        JFrame frame = new JFrame();
        JButton button = new JButton("click me");

        frame.getContentPane().add(button);

        frame.setSize(300,300);
        frame.setVisible(true);

    }
}