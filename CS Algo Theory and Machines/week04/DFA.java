import java.util.HashMap;
import java.util.Map;


public class DFA {

    private Map<Integer, Map<Character, Integer>> transitions;
    private int initialState;
    private int currentState;

    public DFA(Map<Integer, Map<Character, Integer>> transitions, int initialState) {
        this.transitions = transitions;
        this.initialState = initialState;
        this.currentState = initialState;

    }

    public void reset() {
        currentState = initialState;
    }

    public boolean process(String input) {
        for (char symbol : input.toCharArray()) {
            if (!transitions.containsKey(currentState) || !transitions.get(currentState).containsKey(symbol)) {
                return false; // No transition available for the current state and input symbol
            }
            currentState = transitions.get(currentState).get(symbol);
        }
        // Check if the final state is an accepting state
        return currentState == 1; // Modify this according to your DFA's final state(s)
    }

    public static void main(String[] args) {
        // Define the transitions of the DFA
        Map<Integer, Map<Character, Integer>> transitions = new HashMap<>();
        // Example transitions for a DFA recognizing strings with an even number of 'a's
        transitions.put(0, Map.of('a', 1)); // From state 0 to state 1 on input 'a'
        transitions.put(1, Map.of('a', 0)); // From state 1 to state 0 on input 'a'
        // Initial state
        int initialState = 0;

        // Create the DFA instance
        DFA dfa = new DFA(transitions, initialState);

        // Test the DFA
        System.out.println(dfa.process("aa")); // true (even number of 'a's)
        System.out.println(dfa.process("aaa")); // false (odd number of 'a's)
        System.out.println(dfa.process("")); // true (empty string is accepted)
        System.out.println(dfa.process("ab")); // false (input contains 'b', not recognized)
    }


    
}
