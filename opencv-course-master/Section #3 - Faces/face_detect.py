#pylint:disable=no-member

import cv2 as cv

img = cv.imread('/home/bkha0016/Documents/opencv-course-master/Resources/Photos/group 2.jpg')
cv.imshow('Group of 5 people', img)

# do not need color in the image, display it as a gray scale for edge detection
gray = cv.cvtColor(img, cv.COLOR_BGR2GRAY)
cv.imshow('Gray People', gray)

#reading the haar_cascade variable (read the XML codes)
haar_cascade = cv.CascadeClassifier('haar_face.xml')

#detecting the face  using detect multi scale
#minneighbors speciesi the rectangle should be called in the face
faces_rect = haar_cascade.detectMultiScale(gray, scaleFactor=1.1, minNeighbors=6)

print(f'Number of faces found = {len(faces_rect)}')

#making the rectangle in the picture
for (x,y,w,h) in faces_rect:           #green color
    cv.rectangle(img, (x,y), (x+w,y+h), (0,255,0), thickness=2)

cv.imshow('Detected Faces', img)



cv.waitKey(0)