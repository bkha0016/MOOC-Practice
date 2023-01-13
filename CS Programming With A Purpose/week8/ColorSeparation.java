import java.awt.Color;
// Data type: Image -> Image
// Converting the image into diff style (red, green, blue laminates)

public class ColorSeparation {
    public static void main(String[] args) {
        // input args for the picture
        Picture pic = new Picture(args[0]);

        for (int col = 0; col < pic.width(); col++) {
            for (int row = 0; row < pic.height(); row++) {
                // fill in each pixel of the image
                Color color = pic.get(col, row);
                // red laminate by setting the R = getRed() and G & B = 0
                int r = color.getRed();
                pic.set(col, row, new Color(r, 0, 0));

            }
            pic.show();

        }

    }
}
