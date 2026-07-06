import cv2 as cv

imgCats = cv.imread("/home/bkha0016/Documents/opencv-course-master/Resources/Photos/cats.jpg")

cv.imshow("Cats", imgCats)

gray = cv.cvtColor(imgCats, cv.COLOR_BGR2GRAY)
cv.imshow("Gray", gray)

#cv2.Canny(image, T_lower, T_upper, aperture_size, L2Gradient)
canny = cv.Canny(imgCats, 125, 175)
cv.imshow("Canny", canny)

#cv2.CHAIN_APPROX_NONE => all the boundaru points are stored
#cv2.CHAIN_APPROX_SIMPLE => removes all redundant points and compress the contour
contours, hierarchies = cv.findContours(canny, cv.RETR_LIST, cv.CHAIN_APPROX_SIMPLE)
print(f'{len(contours)} contour(s) found!')

cv.waitKey(0)