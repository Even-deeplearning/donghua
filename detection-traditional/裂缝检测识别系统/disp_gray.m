clc; clear all; close all;
Img = imread(fullfile(pwd, 'images', 'test.png'));
I = rgb2gray(Img);
figure; 
subplot(1, 2, 1); imshow(Img, []); title('����ͼ��');
subplot(1, 2, 2); imshow(I, []); title('�Ҷ�ͼ��');

% ��δ���Ĺ�����֮ǰ�Ĵ�����ͬ�����Ƕ�ȡһ��ͼƬ������ת��Ϊ�Ҷ�ͼ�񣬲��ڴ�������ʾԭͼ��ͻҶ�ͼ��