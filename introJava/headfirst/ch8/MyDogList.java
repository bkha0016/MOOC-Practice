public class MyDogList {
    private Dog[] dogs = new Dog[5]; //use a plain old Dog array behind the scenes
    private int nextIndex = 0; // increment this each time a new dog is added


public void add(Dog d) {
    if (nextIndex < dog.length) {
        dogs[nextIndex] = d;
        System.out.println("Dog added at " + nextIndex);
        nextIndex++;
    }
    }
}

class Dog {
    

}