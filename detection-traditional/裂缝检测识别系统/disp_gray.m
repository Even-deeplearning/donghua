clc; clear all; close all;
Img = imread(fullfile(pwd, 'images', 'test.png'));
I = rgb2gray(Img);
figure; 
subplot(1, 2, 1); imshow(Img, []); title('输入图像');
subplot(1, 2, 2); imshow(I, []); title('灰度图像');

% 这段代码的功能与之前的代码相同，都是读取一张图片，将其转换为灰度图像，并在窗口中显示原图像和灰度图像。