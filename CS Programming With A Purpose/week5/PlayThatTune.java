public class PlayThatTune {
    public static void main(String[] args) {
        double tempo = Double.parseDouble(args[0]);

        while (!StdIn.isEmpty()) {
            int pitch = StdIn.readInt();
            double duration = StdIn.readDouble() * tempo;
            double hz = 440 * Math.pow(2, pitch / 12.0);
            double[] a = PlayThatNote.tone(hz, duration);
            StdAudio.play(a);

        }


    }
}
