import cv2 as cv
import numpy as np


img = cv.imread("/home/bkha0016/Documents/opencv-course-master/Resources/Photos/park.jpg")
cv.imshow("Boston", img)

# blank -> height & widht
blank = np.zeros(img.shape[:2], dtype = "uint8")

b,g,r = cv.split(img)
blue = cv.merge([b, blank, blank])
green = cv.merge([blank, g, blank])
red = cv.merge([blank, blank, r])



cv.imshow("blue", blue)
cv.imshow('red', red)
cv.imshow('green', green)

print(img.shape, b.shape, g.shape, r.shape)


merged = cv.merge([b,g,r])
cv.imshow('Merge Image', merged)

cv.waitKey(0)
