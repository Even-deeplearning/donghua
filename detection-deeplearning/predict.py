import time

import cv2
import numpy as np
from PIL import Image

from deeplab import DeeplabV3

if __name__ == "__main__":

    deeplab = DeeplabV3()

# mode=dir_predict 为检测一个文件夹里所有图片
# mode0=predict    检测文件夹里指定的一张图片

    mode = "dir_predict"

    count           = False
    name_classes    = ["background","crack"]


    dir_origin_path = "/root/jiance/image"
    dir_save_path   = "/root/jiance/show"


    if mode == "predict":

        while True:
            img = input('Input image filename:')
            try:
                image = Image.open(img)
            except:
                print('Open Error! Try again!')
                continue
            else:
                r_image = deeplab.detect_image(image, count=count, name_classes=name_classes)
                r_image.show()
                r_image.save("/root/Detect/show")
        
    elif mode == "dir_predict":
        import os
        from tqdm import tqdm

        img_names = os.listdir(dir_origin_path)
        for img_name in tqdm(img_names):
            if img_name.lower().endswith(('.bmp', '.dib', '.png', '.jpg', '.jpeg', '.pbm', '.pgm', '.ppm', '.tif', '.tiff')):
                image_path  = os.path.join(dir_origin_path, img_name)
                image       = Image.open(image_path)
                r_image     = deeplab.detect_image(image)
                if not os.path.exists(dir_save_path):
                    os.makedirs(dir_save_path)
                r_image.save(os.path.join(dir_save_path, img_name))

