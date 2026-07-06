import java.io.*;
import java.net.InetSocketAddress;
import java.nio.channels.Channels;
import java.nio.channels.SocketChannel;
import java.nio.charset.StandardCharsets;


public class DailyAdviceClient {
    public void go() {
        // Define the server address as being port 5000, on the same host this code is running on
        InetSocketAddress serverAddress = new InetSocketAddress("127.0.0.1", 5000);
        // Create a SocketChannel by opening one for the server's address
        try (SocketChannel socketChannel = SocketChannel.open(serverAddress)){
            // Chain a BufferedReader to the Reader from the SocketChannel
            Reader channelReader = Channels.newReader(socketChannel, StandardCharsets.UTF_8);
            BufferedReader reader = new BufferedReader(channelReader);

            // This readLine() is EXACTLY the same as if you were using a BufferedReader chained to a FILE
            String advice = reader.readLine();
            System.out.println("Today you should: " + advice);

            reader.close();

        } catch(IOException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        new DailyAdviceClient().go();
    }

}