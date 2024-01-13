import java.util.*;

public class Inventory {
    private List guitars;

    public Inventory() {
        guitars = new LinkedList();
    }

    public void addGuitar(String serialNumber, double price, Builder builder, String model, Type type, Wood backWood, Wood topWood) {
        Guitar guitar = new Guitar(serialNumber, price, builder, model, type, backWood, topWood);

        guitars.add(guitar);
    }

    public Guitar getGuitar(String serialNumber) {
        for (Iterator i = guitars.iterator(); i.hasNext(); ) {
            Guitar guitar = (Guitar)i.next();
            if (guitar.getSerialNumber().equals(serialNumber)) {
                return guitar;
            }
        }
        return null;
    }

    /** 
    // This method is a bit of a mess it compares each property of guitar object its passed in to each guitar object in Rick's inventory
    public Guitar search(Guitar searchGuitar) {
        for (Iterator i = guitars.iterator(); i.hasNext(); ) {
            Guitar guitar = (Guitar)i.next();
            // ignore serial number since that's unique
            // ignore price since that's unique
            if (searchGuitar.getBuilder() != guitar.getBuilder()) continue;
            String model = searchGuitar.getModel().toLowerCase();

            if ((model != null) && (!model.equals("")) && (!model.equals(guitar.getModel().toLowerCase()))) continue;

            if (searchGuitar.getType() != guitar.getType()) continue;

            if (searchGuitar.getBackWood() != guitar.getBackWood()) continue;

            if (searchGuitar.getTopWood() != guitar.getTopWood()) continue;

            return guitar;
        }
        return null;
    }
    **/

    // Rick's invenotry but returns all the guitars that match his client's specs in a list
    public List search(Guitar searchGuitar) {
        List matchingGuitars = new LinkedList();

        for (Iterator i = guitars.iterator(); i.hasNext(); ) {
            Guitar guitar = (Guitar) i.next();
            // ignore serial number since that's unique
            // ignore price since that's unique
            if (searchGuitar.getBuilder() != guitar.getBuilder()) continue;

            String model = searchGuitar.getModel();
            if ((model != null) && (!model.equals("")) && (!model.equals(guitar.getModel()))) continue;

            if (searchGuitar.getType() != guitar.getType()) continue;

            if (searchGuitar.getBackWood() != guitar.getBackWood()) continue;

            if (searchGuitar.getTopWood() != guitar.getTopWood()) continue;

            matchingGuitars.add(guitar);

        }

        return matchingGuitars;

    }



    
}
