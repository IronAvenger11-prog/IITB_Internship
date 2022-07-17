import numpy as np
import cv2 as cv2

import glob
import matplotlib.pyplot as plt
import numpy as np

imdir = r"C:\Users\Abhishek Raman\Desktop\Abhishek\Recordings\Img_File4\*"
ext = ['jpg']    # Add image formats here
f = open("action_7.txt","a")
#g = open("clasper.txt","a")
files = []
[files.extend(glob.glob(imdir + '.' + e)) for e in ext]

images = [cv2.imread(file) for file in files]
i=0
for image in images: 
    

    


#image = cv2.imread(r'C:\Users\nemas\Desktop\Instrument tracking\Tracking\frame0.png')
    boundaries = [
    	([720, 0, 0], [720,0, 0]),
    	([0, 560, 0], [0, 560, 0])
    ]
    
    for (lower, upper) in boundaries:
        lower = np.array(lower, dtype = "uint8")
        upper = np.array(upper, dtype = "uint8")
        mask = cv2.inRange(image, lower, upper)
        output = cv2.bitwise_and(image, image, mask = mask)
        gray = cv2.cvtColor(output,cv2.COLOR_BGR2GRAY)
        thresh = cv2.threshold(gray,50,75,cv2.THRESH_BINARY)[1]
        result = output.copy()
        contours = cv2.findContours(thresh, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)
        contours = contours[0] if len(contours) == 2 else contours[1]
        
        
        for cntr in contours:
            x,y,w,h = cv2.boundingRect(cntr)
            cv2.rectangle(result, (x, y), (x+w, y+h), (0, 0, 255), 2) 
            rect = cv2.minAreaRect(cntr) 
            box = cv2.boxPoints(rect) 
            box = np.int0(box) 
            cv2.drawContours(result,[box],0,(0,191,255),2)
           
            #cv2.drawContours(image,[box],0,(0,191,255),2)
            print([box])
            print("image",i, box[0],box[1],box[2],box[3],rect[2],file=f)
            #f.write(str("image",i, box[0],box[1],box[2],box[3],rect[2],file=f))
            
    i=i+1
            
    cv2.imshow("images", np.hstack([image,result]))
    cv2.waitKey(0)
            
        