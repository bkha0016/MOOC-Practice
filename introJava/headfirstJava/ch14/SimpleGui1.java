import javax.swing.*;

public class SimpleGui1 {
    public static void main(String[] args) {
        JFrame frame = new JFrame();
        JButton button = new JButton("click me");

        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE); // this line makes the program quit as soon you close the window

        frame.getContentPane().add(button); // add the button to the frame's content pane

        frame.setSize(300,300); // give the frame size in pixels

        frame.setVisible(true); // make it visible (if you forget, you wont see anything when running this code)
    }
}