import javax.sound.midi.*;
import javax.swing.*;
import java.awt.*;
import java.util.Random;

import static javax.sound.midi.ShortMessage.*;

public class MiniMusicPlayer3 {
    private MyDrawPanel panel;
    private Random random = new Random();
    

    public static void main(String[] args) {
        MiniMusicPlayer3 mini = new MiniMusicPlayer3();
        mini.go();
    }

    public void setUpGui() {
        JFrame frame = new JFrame("My First Music Video");
        panel = new MyDrawPanel();
        frame.setContentPane(panel);
        frame.setBounds(30, 30, 300, 300);
        frame.setVisible(true);
    }

    public void go() {
        setUpGui();

        try {
            Sequencer sequencer = MidiSystem.getSequencer();
            sequencer.open();
            sequencer.addControllerEventListener(panel, new int[] {127});
            Sequence seq = new Sequence(Sequencer.PPQ, 4);
            Track tracak = seq.createTrack();

            int note;
            for (int i = 0; i < 60; i += 4) {
                note = random.nextInt(50) + 1;
            }

        }
    }
}
