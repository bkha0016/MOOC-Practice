Part 1
// Start w/ the foreground image u want
var fgImage = new SimpleImage("drewRobert.png");

//... and with the bg img you want to be the bgimage
var bgImage = new SimpleImage("dinos.png");

//Make a blank image of the same size (output)

var output = new SimpleImage(fgImage.getWidth(), fgImage.getHeight());


//write code for each of these steps:
//for each pixel in fgimage

for (var pixel of fgImage.values()){
    //look at the pixel if its green
    if (pixel.getGreen() > pixel.getRed()+ pixel.getBlue()){
        //look at same position in bgImage
        var x = pixel.getX();
        var y = pixel.getY();
        
        var bgPixel = bgImage.getPixel(x,y);
        
        //set output corresponding pixel to bgImage pixe;
        output.setPixel(x,y, bgPixel);
        
        
    }
    else{
        
        output.setPixel(pixel.getX(), pixel.getY(), pixel);
    }
    
    
}

print(output);


part 2:

// write your code here

var img = new SimpleImage(200,200);
var width = img.getWidth();
var height = img.getHeight();

for (var pixel of img.values()){
    var x = pixel.getX();
    var y = pixel.getY();
    
    if(x < width/2 && y < height/2){
        pixel.setRed(255);
        pixel.setBlue(0);
        pixel.setGreen(0);
    }
    if(x < width/2 && y >= height/2){
        pixel.setRed(255);
        pixel.setBlue(255);
        pixel.setGreen(0);
        
    }
     if(x >= width/2 && y < height/2){
        pixel.setRed(0);
        pixel.setBlue(0);
        pixel.setGreen(255);
        
     }
     
     if(x >= width/2 && y >= height/2){
        pixel.setRed(0);
        pixel.setBlue(255);
        pixel.setGreen(0);
     }
    
}

print(img);



part 3
// write your code here




function setBlack(image, thick){
    var img = new SimpleImage(image);
    var height = img.getHeight();
    var width = img.getWidth();
    
    
    for(var pixel of img.values()){
        var x = pixel.getX();
        var y = pixel.getY();
        if(x < (thick)){
            pixel.setRed(0);
            pixel.setGreen(0);
            pixel.setBlue(0);
        }
        if(x >= (width-thick)){
            pixel.setRed(0);
            pixel.setGreen(0);
            pixel.setBlue(0);   
        }
        if(y < thick){
            pixel.setRed(0);
            pixel.setGreen(0);
            pixel.setBlue(0); 
            
        }
        if(y >= (height-thick)){
            pixel.setRed(0);
            pixel.setGreen(0);
            pixel.setBlue(0); 

        }
    }

return img}

result = setBlack("smallpanda.png");
print(result);

