public class Boo {
    public Boo(int i) {}
    public Boo(String s) {}
    public Boo(String s, int i) {}
}

class SonOfBoo extends Boo {

    public SonOfBoo() {
        super("boo");
    }

    public SonOfBoo(int i) {
        super("fred");
    }

    public SonOfBoo(String s) {
        super(42);
    }

    /* Must explcity defined a constructor of Boo
    public SonOfBoo(int i, String s) {

    }
    */
}