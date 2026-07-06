import java.awt.Color;

public class Grayscale {
    public static void main(String[] args) {
        // Create a new picture
        Picture pic = new Picture(args[0]);
        for (int col = 0; col < pic.width(); col++) {
            for (int row = 0; row < pic.height(); row++) {
                // fill in each pixel of the image
                Color color = pic.get(col, row);
                Color gray = Luminance.toGray(color);
                pic.set(col, row, gray);

            }

        }
        // show the picture
        pic.show();

    }
}
