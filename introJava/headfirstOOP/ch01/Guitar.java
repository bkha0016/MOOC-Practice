public class Guitar {
    // These are all the properties we saw from the class diagram for the guitar class
    private String serialNumber, model;
    private double price;
    private Wood backWood, topWood;
    private Type type;
    private Builder builder;

    // Create a constructor before you can use this class & its methods
    public Guitar(String serialNumber, double price, Builder builder, String model, Type type, Wood backWood, Wood topWood){
        this.serialNumber = serialNumber;
        this.price = price;
        this.builder = builder;
        this.model = model;
        this.type = type;
        this.backWood = backWood;
        this.topWood = topWood;
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

    public Builder getBuilder() {
        return builder;
    }

    public String getModel() {
        return model;
    }

    public Type getType() {
        return type;
    }

    public Wood getBackWood() {
        return backWood;
    }

    public Wood getTopWood() {
        return topWood;
    }

}