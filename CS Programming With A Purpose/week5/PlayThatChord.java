public class PlayThatChord {
    public static double[] avg(double[] a, double[] b) {
        double[] c = new double[a.length];
        for (int i = 0; i < a.length; i++) {
            c[i] = (a[i] / 2.0) + (b[i] / 2.0);

        }
        // returns an array
        return c;
    }

    public static double[] chord(int pitch1, int pitch2, double d) {
        double hz1 = 440.0 * Math.pow(2, pitch1 / 12.0);
        double hz2 = 440.0 * Math.pow(2, pitch2 / 12.0);
        double[] a = PlayThatNote.tone(hz1, d);
        double[] b = PlayThatNote.tone(hz2, d);

        // also returns an array
        return avg(a, b);
    }

    public static void main(String[] args) {
        int pitch1 = Integer.parseInt(args[0]);
        int pitch2 = Integer.parseInt(args[1]);
        double duration = Double.parseDouble(args[2]);
        double[] a = chord(pitch1, pitch2, duration);
        StdAudio.play(a);

    }
}
