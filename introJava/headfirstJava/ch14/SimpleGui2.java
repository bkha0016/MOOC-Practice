import javax.swing.*;
import java.awt.event.*; // import statement for the package that action listener and action event are in

// implement the interface (the buttong will give events only to action listener implementers)
public class SimpleGui2 implements ActionListener {
    private JButton button;

    public static void main(String[] args) {
        SimpleGui2 gui = new SimpleGui2();
        gui.go();

    }

    public void go() {
        JFrame frame = new JFrame();
        button = new JButton("click me");

        button.addActionListener(this); // add me to your list of listener

        frame.getContentPane().add(button);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setSize(300, 300);
        frame.setVisible(true);
    }

    // implement the actionListener intreface's action performed() method
    public void actionPerformed(ActionEvent event) {
        button.setText("I've been clicked!");
    }
    
    // this button calls this method to let you know an event happened
    // it send you an actionevent object as the argument, but we dont need it here
    // knowing the event happened in enough info for us 
}
