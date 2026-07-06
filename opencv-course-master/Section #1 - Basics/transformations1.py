import cv2 as cv
import numpy as np

imgBost = cv.imread("/home/bkha0016/Documents/opencv-course-master/Resources/Photos/park.jpg")

cv.imshow("Boston", imgBost)

#translation
def translate(img, x, y):
    transMat = np.float32([[1,0,x], [0,1,y]])
    dimensions = (img.shape[1], img.shape[0])
    return cv.warpAffine(img, transMat, dimensions)

# -x -> left
# -y -> up
# x -> right
# y -> down

translated = translate(imgBost, -100, 100)
cv.imshow("Translated", translated)

#rotation
def rotate(img, angle, rotPoint = None):
    (height, width) = img.shape[:2]

    if rotPoint is None:
        rotPoint = (width//2, height//2)

    rotMat = cv.getRotationMatrix2D(rotPoint, angle, 1.0)
    dimensions = (width, height)

    return cv.warpAffine(img, rotMat, dimensions)

rotated = rotate(imgBost, 45)
cv.imshow("Rotated", rotated)


#resizing
resized = cv.resize(imgBost, (500,500), interpolation = cv.INTER_CUBIC)
cv.imshow("Resized", resized)

#flipping
flip = cv.flip(imgBost, 1)
cv.imshow("Flip", flip)













cv.waitKey(0)