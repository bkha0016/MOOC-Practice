import cv2 as cv

img = cv.imread("/home/bkha0016/Documents/opencv-course-master/Resources/Photos/cat.jpg")
cv.imshow("cat", img)

#converting to grayscale
gray = cv.cvtColor(img, cv.COLOR_BGR2GRAY)
cv.imshow("Gray", gray)


imgBost = cv.imread("/home/bkha0016/Documents/opencv-course-master/Resources/Photos/park.jpg")
#blur the image
imgBostBlur = cv.GaussianBlur(imgBost, (3,3), cv.BORDER_DEFAULT)
cv.imshow("Boston", imgBostBlur)

#Edge cascade
canny = cv.Canny(imgBost, 125, 175)
cv.imshow("Canny", canny)

#dilating the image
dilate = cv.dilate(canny,(3,3), iterations = 1)
cv.imshow("Dilated", dilate)

#eroding the image
eroded = cv.erode(dilate, (3,3), iterations = 1)
cv.imshow("Eroded", eroded)

#Resize
resized = cv.resize(img, (500,500))
cv.imshow("Resized", resized)

#cropping
cropped = img[50:200, 200:400]
cv.imshow("cropped", cropped)


cv.waitKey(0)