// write your code here
// using for loops

var img = new SimpleImage(200,200);

print(img);


for (var pixel of img.values()){
    var newG = 255;
    pixel.setRed(newG);
    pixel.setGreen(newG);
    pixel.setBlue(0);
}

print("Yellow: ",img);

for (var pixel of img.values()){
    pixel.setRed(255);
    pixel.setGreen(0);
    pixel.setBlue(255);
}

print("Magenta: ", img);



for (var pixel of img.values()){
    pixel.setRed(0);
    pixel.setGreen(41);
    pixel.setBlue(58);
}

print("ocean blue: ", img)