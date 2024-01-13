public class Guitar {
    // These are all the properties we saw from the class diagram for the guitar class
    private String serialNumber;
    private double price;
    private GuitarSpec spec;

    // Create a constructor before you can use this class & its methods
    public Guitar(String serialNumber, double price, GuitarSpec spec){
        this.serialNumber = serialNumber;
        this.price = price;
        this.spec = spec;
        
    }

    public String getSerialNumber() {
        return serialNumber;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(float newPrice) {
        this.price = newPrice;
    }

    public GuitarSpec getSpec() {
        return spec;
    }

}