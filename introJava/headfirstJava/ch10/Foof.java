/*
 * A FINAL VARIABLES MEANS YOU CANT CHANGE ITS VALUE
 * A FINAL METHOD MEANS YOU CANT OVERRIDE THE METHOD
 * A FINAL CLASS MEANS YOU CANT EXTEND THE CLASS (YOU CANT MAKE A SUBCLASS)
 */


public class Foof {
    final int size = 3; // now you can't change size
    final int whuffie;

    Foof() {
        whuffie = 42; // now you cant change whuffie
    }

    void doStuff(final int x) {
        // you can't change x
    }

    void doMore() {
        final int z = 7;
        // you can't change z
    }

    final void calcWhuffie() {
        // important things
        // that must never be overriden
    }
    
}

final class MyMostPerfectClass {
    // cannot be extended
}
