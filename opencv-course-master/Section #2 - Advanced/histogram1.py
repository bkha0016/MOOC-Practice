import cv2 as cv
import matplotlib.pyplot as plt
#histogram --> visual pixel distribution center / plot of high level intiution of pixel distribution in the image

img = cv.imread("/home/bkha0016/Documents/opencv-course-master/Resources/Photos/cats 2.jpg")
cv.imshow("Cats", img)

gray = cv.cvtColor(img, cv.COLOR_BGR2GRAY)
cv.imshow('Gray', gray)
'''
# Grayscale histogram
gray_hist = cv.calcHist([gray], [0], None, [256], [0,256])

plt.figure()
plt.title("Grayscale Histogram")
plt.xlabel("Bins")
plt.ylabel("# of pixels")
plt.plot(gray_hist)
plt.xlim([0,256])
plt.show()
'''
# Colour histogram
plt.figure()
plt.title("Colour Histogram")
plt.xlabel("Bins")
plt.ylabel("# of pixels")

colors = ("b", "g", "r")
for i,col in enumerate(colors):
    hist = cv.calcHist([img], [i], None, [256], [0,256])
    plt.plot(hist, color = col)
    plt.xlim([0,256])

plt.show()


cv.waitKey(0)