import java.util.*;

class SongV2 implements Comparable<SongV2> {
    // three instance variables for the 3 song attributes in the file
    private String title;
    private String artist;
    private int bpm;


    // The sort() method sends a Song to compareTo() to see how that Song compares
    // to the Song on which the method was invoked
    public int compareTo(SongV2 s) {
        // Simple! we just pass the work on to the tile String objects,
        // Since we know String have a compareTo() method.
        return title.compareTo(s.getTitle());
    }

    SongV2(String title, String artist, int bpm) {
        // this makes sure that the instance variable is used to assign towards the argument
        this.title = title;
        this.artist = artist;
        this.bpm = bpm;
    }
    // the getter methods for the three attributes
    public String getTitle() {
        return title;
    }

    public String getArtist() {
        return artist;
    }

    public int getBpm() {
        return bpm;
    }

    // override toString() <- produce to see a title
    public String toString() {
        return title;
    }
}

class ArtistCompare implements Comparator<SongV2> {
    public int compare(SongV2 one, SongV2 two) {
        return one.getArtist().compareTo(two.getArtist());
    }
}

class TitleCompare implements Comparator<SongV2> {
    public int compare(SongV2 one, SongV2 two) {
        return one.getTitle().compareTo(two.getTitle());
    }
}

class Jukebox1 {
    public static void main(String[] args) {
        new Jukebox1().go();
    }

    public void go() {
        // we'll store the songs in a list or array filled with songs object
        List<SongV2> songList = MockSongs.getSongsV2();
        // then print the content of the songList
        System.out.println(songList);
        // sort our song titles using "natural ordering"
        // well it was fixed using a object ordering
        Collections.sort(songList);
        System.out.println(songList);

        // sort by using the artist name
        ArtistCompare artistCompare = new ArtistCompare();
        songList.sort(artistCompare);
        System.out.println(songList);

        // sort by using the title name
        TitleCompare titleCompare = new TitleCompare();
        songList.sort(titleCompare);
        System.out.println(songList);
    }
    
}




class MockSongs {
    // static makes this shared among all objects
    // but in this case it doesnt have instance fields so it doesnt matter
    public static List<SongV2> getSongsV2() {
        List<SongV2> songs = new ArrayList<SongV2>();
        songs.add(new SongV2("somersault", "zero 7", 147));
        songs.add(new SongV2("cassidy", "grateful dead", 158));
        songs.add(new SongV2("$10", "hitchhiker", 140));

        songs.add(new SongV2("havana", "cabello", 105));
        songs.add(new SongV2("Cassidy", "grateful dead", 158));
        songs.add(new SongV2("50 ways", "simon", 102));
        return songs;
    }
}