import java.awt.Color;

public class FlipX {
    public static void main(String[] args) {
        // input args for the picture
        Picture pic = new Picture(args[0]);
        int width = pic.width();
        int height = pic.height();
        pic.show();
        for (int col = 0; col < height; col++) {
            for (int row = 0; row < width / 2; row++) {
                // fill in each pixel of the image
                Color c1 = pic.get(col, row);
                Color c2 = pic.get(width - row - 1, col);
                pic.set(row, col, c2);
                pic.set(width - row - 1, col, c1);

            }

        }
        // show the picture
        pic.show();

    }
}
