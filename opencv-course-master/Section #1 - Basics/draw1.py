import cv2 as cv
import numpy as np 

blank = np.zeros((500,500,3), dtype = "uint8")
cv.imshow("Blank", blank)

#1. Point the image in a certain colour
blank[200:300, 300:400] = 0, 255, 180 #green value high
cv.imshow("Green", blank)

#2. Draw a Rectangle
#cv2.rectangle(image, start_point (x,y), end_point, color, thickness)

cv.rectangle(blank, (0,0), (blank.shape[1] // 2, blank.shape[0] // 2), (0, 255,0), thickness = -1)
cv.imshow('Rectangle', blank)

#3. Draw A Circle
cv.circle(blank, (blank.shape[1]//2, blank.shape[0]//2), 40, (0,0,255), thickness = 3)
cv.imshow("Circle", blank)

#4. Draw a line
cv.line(blank, (0,0), (blank.shape[1]//2, blank.shape[0]//2), (255,255,255), thickness = 3)
cv.imshow("Line", blank)

#5. Write text
cv.putText(blank, "Hello", (225,300), cv.FONT_HERSHEY_TRIPLEX, 1.0, (170, 180,120), 2)
cv.imshow("Text", blank)


img = cv.imread("/home/bkha0016/Documents/opencv-course-master/Resources/Photos/cat.jpg")
cv.imshow("Cat", img)

cv.waitKey(0)