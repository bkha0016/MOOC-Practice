import java.io.*; // serializable is in the java.io package, so you need to import


// no methods to implement, but when you say implements serializable, 
// it says to the JVM, its OK to serialize object of this type

public class Square implements Serializable {
    private int width;
    private int height;

    public Square(int width, int height) {
        this.width = width;
        this.height = height;
    }

    public static void main(String[] args) {
        Square mySquare = new Square(50, 50);

        try {
            // connect to a file named "foo.ser" if it exits, if it doesnts, make a new file named foo.ser
            FileOutputStream fs = new FileOutputStream("foo.ser");
            ObjectOutputStream os = new ObjectOutputStream(fs); // make an objectOuputStream chained to the connection stream. tell it to write the object
            os.writeObject(mySquare);
            os.close();
        } catch(Exception ex) {
            ex.printStackTrace();
        }

    }

}