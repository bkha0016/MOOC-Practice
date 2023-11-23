import javax.sound.midi.*;
// we're using static import to use the constants in the ShortMessage class
import static javax.sound.midi.ShortMessage.*;

public class MiniMiniMusicApp {
    public static void main(String[] args) {
        MiniMiniMusicApp mini = new MiniMiniMusicApp();
        mini.play();

    }

    public void play() {
        try {
            Sequencer player = MidiSystem.getSequencer(); // get a seqeucner and open it
            player.open();

            Sequence seq = new Sequence(Sequence.PPQ, 4); // dont worry about hte args in the sequence constructor

            Track track = seq.createTrack(); // track lives in the sequence & MIDI data lives in the track

            // put some MidiEvents into the track
            ShortMessage msg1 = new ShortMessage();
            msg1.setMessage(NOTE_ON, 1, 44, 100); // message type, channel, note to play, velocity
            MidiEvent noteOn = new MidiEvent(msg1, 1); // event, duration of Event
            track.add(noteOn);

            ShortMessage msg2 = new ShortMessage();
            msg2.setMessage(NOTE_OFF, 1, 44, 100);
            MidiEvent noteOff = new MidiEvent(msg2, 16);
            track.add(noteOff);

            player.setSequence(seq); // give the sequence to the sequencer (like selecting the song to play)
            player.start();


        } catch (Exception e) {
            e.printStackTrace();
        }

    }
    
}
