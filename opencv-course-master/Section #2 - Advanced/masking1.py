import cv2 as cv
import numpy as np


img = cv.imread("/home/bkha0016/Documents/opencv-course-master/Resources/Photos/cats.jpg")
cv.imshow("Cats", img)

#the dimension of the mask must be the same size as the image
#if not is not going to wokr
blank = np.zeros(img.shape[:2], dtype = "uint8")
cv.imshow("Blank Image", blank)

mask = cv.circle(blank, (img.shape[1] // 2, img.shape[0]//2 + 45), 100, 255, -1)
cv.imshow('Mask', mask)

#use cv.bitwise_and to mask the images
masked = cv.bitwise_and(img,img,mask=mask)
cv.imshow('Masked Image', masked)


cv.waitKey(0)
