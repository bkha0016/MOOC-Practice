import cv2 as cv
import matplotlib.pyplot as plt


img = cv.imread("/home/bkha0016/Documents/opencv-course-master/Resources/Photos/park.jpg")
cv.imshow("Boston", img)

# BGR to GrayScale
gray = cv.cvtColor(img, cv.COLOR_BGR2GRAY)
cv.imshow("Gray", gray)

# BGR to HSV
hsv = cv.cvtColor(img, cv.COLOR_BGR2HSV)
cv.imshow("HSV", hsv)

# BGR to LAB
lab = cv.cvtColor(img, cv.COLOR_BGR2LAB)
cv.imshow("LAB", lab)

'''
#BGR is not recognized in matplot lib
plt.imshow(img)
plt.show()

'''

# BGR to RGB
rgb = cv.cvtColor(img, cv.COLOR_BGR2RGB)
cv.imshow("RGB", rgb)


cv.waitKey(0)