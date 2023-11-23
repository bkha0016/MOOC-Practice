/* WE HAVE 5 INSTANCE VARIABLES
 * picture - representing the JPEG of this animal
 * food - the type of food this animal eats (two values: meat or grass)
 * hunger - int representing the hunger level of the animal
 * boundaries - height & width of space (640 x 840)
 * 
 *  WE HAVE 4 METHODS:
 *  makeNoise() - behavior for when the animal is supposed to make nosie
 *  eat() - behavior for when the animal encounters its preferred food source, meat or grass
 *  sleep() - behavior for when the animal is considered asleep.
 *  roam() - bheavior for when the animal is not eating or sleeping
 * 
 *  Better override these two methods, eat()
 *  and makeNoise(), so that each animal type can 
 *  define its own specific behavior for eating and making noise
 *  for now, it looks like sleep() and roam() can stay generic
 */



public class Animal {

    /*
    * Animal has a picture/image, food, hunger, boundaries, and location 
    * Animal can makeNoise(), eat(), sleep(), and roam()
    */

    // TALK ABOUT THE SUBCLASSES & SUPERCLASSES
    /*
    * Feline is a animal
    * Lion, Tiger, and cat is a feline and also an animal 
    * Hippo is an animal
    * Wolf, Dog is a canine and also a animal
    */


}