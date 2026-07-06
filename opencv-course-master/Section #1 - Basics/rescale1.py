import cv2 as cv


img = cv.imread("/home/bkha0016/Documents/opencv-course-master/Resources/Photos/cat_large.jpg")
cv.imshow("Cat", img)

def rescaleFrame(frame, scale = 0.25):
    #images, videos and live video
    width = int(frame.shape[1] * scale)
    height = int(frame.shape[0] * scale)
    dimensions = (width, height)

    #cv2.resize(source, dsize, dest, fx, fy, interpolation)

    return cv.resize(frame, dimensions, interpolation = cv.INTER_AREA)

def changeRes(width,height):
    #live video
    capture.set(3, width)
    capture.set(4, height)


resized_image = rescaleFrame(img)
cv.imshow("Image", resized_image)

#reading videos
capture = cv.VideoCapture("/home/bkha0016/Documents/opencv-course-master/Resources/Videos/dog.mp4")

while True:
    isTrue, frame = capture.read()

    frame_resized = rescaleFrame(frame)
    
    cv.imshow("Video", frame)
    cv.imshow("Video Resized", frame_resized)


    if cv.waitKey(20) & 0xFF == ord('d'):
        break

capture.release()
cv.destroyAllWindows()
