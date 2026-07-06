import cv2 as cv

'''

#loads an image from the specified file store it a matrix
#if the images cannot be read then this returns an empty matrix
img = cv.imread("/home/bkha0016/Documents/opencv-course-master/Resources/Photos/cat_large.jpg")

#cv.imshow(window_name, image from the directory)
cv.imshow("Cat", img)
'''
#reading videos
#to get a video capture obejct for the ccamera
capture = cv.VideoCapture("/home/bkha0016/Documents/opencv-course-master/Resources/Videos/dog.mp4")

while True:
    isTrue, frame = capture.read()
    cv.imshow("Video", frame)

    if cv.waitKey(20) & 0xFF == ord('d'):
        break

capture.release()
cv.destroyAllWindows()

#waitKey() method to show the image before it closes
#if its 0 then the argument waits till any of the key is pressed

cv.waitKey(0)

