// GRAPH
// Its a non linear data structure used for storing data
// It is a set of vertices and a collection of edges that connects a pair of vertices
// Graphs help us implement social networking sites such as, Facebook, Twitter. It can be called as Social Networking Graph
// Names of people represent vertices of Graph.
// Friendship between two people can be representd as an Edge of Graph
// Graphs help us organize web content over the interent
// Webpages such as google.com, udemy.com etc represent vertices of Graph.
// A link between two webpages can be represented as an edge of graph

// Undirected GRAPH
// Example - Social Networking Graph is an undirected graph
// If john (vertex) is friend (edge) to Max (vertex), than Max (vertex) is also friend (edge) to John (vertex)
public class Graph {
    private int V; // number of vertices in Graph
    private int E; // number of edges in Graph
    private int[][] adjMatrix;

    public Graph(int nodes) {
        this.V = nodes;
        this.E = 0;
        this.adjMatrix = new int[nodes][nodes];
    }

    public void addEdge(int u, int v) {
        this.adjMatrix[u][v] = 1;
        this.adjMatrix[v][u] = 1;
        E++;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(V + " vertices, " + E + " edges " + "\n");
        for(int v = 0; v < V; v++) {
            sb.append(v + " : ");
            for(int w : adjMatrix[v]) {
                sb.append(w + " ");

            }
            sb.append("\n");

        }

        return sb.toString();
    }


    
    public static void main(String[] args) {
        Graph g = new Graph(4);
        g.addEdge(0, 1);
        g.addEdge(1, 2);
        g.addEdge(2, 3);
        g.addEdge(3, 0);
        System.out.println(g);
        
    }
    
    
}
