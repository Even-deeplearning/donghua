function s_out = hist_con(s_in, flag)
if nargin < 2
    flag = 0;
end
if ndims(s_in) == 3
    I = rgb2gray(s_in);
else
    I = s_in;
end
s_out = histeq(I);
if flag
    figure;
    subplot(2, 2, 1); imshow(I); title('原图');
    subplot(2, 2, 2); imhist(I); title('原图直方图');
    subplot(2, 2, 3); imshow(s_out); title('均衡化结果');
    subplot(2, 2, 4); imhist(s_out); title('均衡化结果直方图');
end
% 这是一个用于直方图均衡化的函数。函数的输入是一个灰度图像s_in和一个可选参数flag。函数首先判断输入图像的维度，如果是彩色图像，则使用rgb2gray函数将其转换为灰度图像。
% 然后，使用histeq函数对灰度图像进行直方图均衡化，将结果存储在s_out中。
% 如果flag参数为真，则创建一个图像窗口，并使用subplot函数在窗口中创建一个2行2列的子图网格。
% 在第一个子图中，使用imshow函数显示原图像I，并添加标题。在第二个子图中，使用imhist函数显示原图像的直方图。
% 在第三个子图中，使用imshow函数显示均衡化后的图像s_out，并添加标题。在第四个子图中，使用imhist函数显示均衡化后图像的直方图。