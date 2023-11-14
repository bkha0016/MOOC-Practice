import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

public class TextArea1 {

    public static void main(String[] args) {
        TextArea1 gui = new TextArea1();
        gui.go();
    }

    public void go() {
        JFrame frame = new JFrame();
        JPanel panel = new JPanel();

        JButton button = new JButton("Just Click It");

        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        JTextArea text = new JTextArea(10, 20);
        text.setLineWrap(true);
        button.addActionListener(e -> text.append("button clicked \n"));

        JScrollPane scroller = new JScrollPane(text);
        scroller.setVerticalScrollBarPolicy(ScrollPaneConstants.VERTICAL_SCROLLBAR_ALWAYS);
        scroller.setHorizontalScrollBarPolicy(ScrollPaneConstants.HORIZONTAL_SCROLLBAR_NEVER);

        panel.add(scroller);

        frame.getContentPane().add(BorderLayout.CENTER, panel);
        frame.getContentPane().add(BorderLayout.SOUTH, button);

        frame.setSize(350,300);
        frame.setVisible(true);



    }

}