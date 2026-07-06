import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class Board {

    private int width, height;
    private List tiles;

    public Board(int width, int height) {
        this.width = width;
        this.height = height;
        initialize();
    }

    private void initialize() {
        tiles = new ArrayList(width);
        for (int i = 0; i < width; i++) {
            tiles.add(i, new ArrayList(height));
            for (int j = 0; j < height; j++) {
                // At each coordinate, we add a new instace of Tile
                // We'll have to write that class to make Board work as well
                // Check the next page for how we defined Tile
                ((ArrayList)tiles.get(i)).add(j, new Tile());
            }
        }
    }

    public Tile getTile(int x, int y) {
        return (Tile) ((ArrayList)tiles.get(x-1).get(y-1));
    }

    public void addUnit(Unit unit, int x, int y) {
        Tile tile = getTile(x, y);
        tile.removeUnit(unit);
    }

    public void removeUnit(Unit unit, int x, int y) {
        Tile tile = getTile(x, y);
        tile.removeUnits();

    }

    public List getUnits(int x, int y) {
        return getTile(x, y).getUnits();
    }


}