import java.util.*;

class Jukebox1 {
    public static void main(String[] args) {
        new Jukebox1().go();
    }

    public void go() {
        // we'll store the song titles in a list of strings
        List<String> songList = MockSongs.getSongStrings();
        // then print the content of the songList
        System.out.println(songList);
    }
    
}




class MockSongs {
    // static makes this shared among all objects
    // but in this case it doesnt have instance fields so it doesnt matter
    public static List<String> getSongStrings() {
        List<String> songs = new ArrayList<String>();
        songs.add("somersault");
        songs.add("cassidy");
        songs.add("$10");
        songs.add("havana");
        songs.add("Cassidy");
        songs.add("50 Ways");
        return songs;
    }
}