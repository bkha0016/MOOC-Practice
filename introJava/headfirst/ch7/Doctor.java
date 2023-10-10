public class Doctor {
    // instance variable
    boolean worksAtHospital;

    void treatPatient() {
        // perform a chekcup
    }
}


public class FamilyDoctor extends Doctor {
    boolean makesHouseCalls;

    void giveAdvice() {
        //give homespun advice
    }
}

public class Surgeon extends Doctor {
    void treatPatient() {
        // perform surgery more specifically
    }
    void makeIncision() {
        // adding another method in this subclass
        // make incision (yikes!)
    }
}