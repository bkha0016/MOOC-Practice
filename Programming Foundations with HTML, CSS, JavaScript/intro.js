//const prompt = require('prompt-sync')(); <-- use to create input/output operation
console.log('Hello World!');
//variables holding numbers
var x = 3;
var y = 5;
var z = x + y;
console.log(z);

x = z-1;
y = 2 * y;
console.log(x,y);

//variables holding images

/*
var fgimage = new SimpleImage("picture.png"); initialize the image
var bgimage = new SimpleImage("picture2.png");



var w = fgImage.getWidth(); <--- get the width of the pic
var h = fgImage.getHeight(); <--- get the height of the pic

*/


/*
Calling methods: semantics
the method returns an answer back & evaluate to that value

use documentation to know what the method does
Duke U documentatinon for java script

some methods have parameters

var fgimage = new SimpleImage("picture.png");
var pixel = fgIage.getPixel(0,0);

calls method getPixel on fgImage
(what are the 0,0 in the parantheses) ,<-- get the pixel using x &y coord

*/


/*
Methods: Invoked on Objects
Funcrions: Not invoked on Objects

    e.g: print(x)




*/

//Simple function: Square a number

function square(x){
    var ans = x**2;
    return ans;



}

console.log(square(5));


/*
Types of data:
A type specifies: 
-how to inerpret that number
-how to operate on that number

*/

var n1 = 26;
var n2 = 16;

var s1 = "a";
var s2 = "b";

var n3 = n1+n2;
var s3 = s1+s2;


console.log(n3,s3);