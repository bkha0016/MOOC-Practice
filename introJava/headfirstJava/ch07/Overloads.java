// Legal examples of method overloading
// Method overloading allows you to define multiple methods in the same class 
// with the same name but different parameters (different in terms of 
// the number of parameters, types of parameters, or both).

public class Overloads {
    String uniqueID;

    public int addNums(int a, int b){
        return a + b;
    }

    public double addNums(double a, double b){
        return a + b;
    }

    public void setUniqueID(String theID){
        // lots of validation code, and then:
        uniqueID = theID;
    }

    public void setUnqiueID(int ssNumber){
        String numString = "" + ssNumber;
        setUniqueID(numString);
    }
    
}
