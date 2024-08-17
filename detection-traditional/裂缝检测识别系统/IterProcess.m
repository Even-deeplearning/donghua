function [bw, th] = IterProcess(Img)
if ndims(Img) == 3
    I = rgb2gray(Img);
else
    I = Img;
end

T0 = (double(max(I(:))) + double(min(I(:))))/2;
flag = 1; 

while flag
    ind1 = I > T0; 
    ind2 = ~ind1;
    T1 = (mean(double(I(ind1))) + mean(double(I(ind2))))/2;
    flag = abs(T1-T0) > 0.6;
    T0 = T1; 
end
bw = ind1;
th = T1;
% 这是一个用于迭代阈值处理的函数。函数的输入参数是图像Img，输出参数是二值图像bw和阈值th。
% 首先，函数判断图像的维数。如果图像是三维的，则使用rgb2gray函数将其转换为灰度图像；否则，直接使用Img作为灰度图像I。
% 接下来，初始化阈值T0为灰度图像的最大像素值和最小像素值的平均值。
% 然后，设置一个循环标志flag为1。
% 在循环中，首先根据当前阈值T0将灰度图像I进行分割，将大于阈值的像素索引保存在ind1中，将小于等于阈值的像素索引保存在ind2中。
% 接着，计算大于阈值和小于等于阈值的像素的平均值，得到新的阈值T1。
% 然后，判断新旧阈值之间的差是否大于0.5，如果是则继续迭代，将新阈值T1赋值给旧阈值T0，并将循环标志flag设置为1；如果不是则停止迭代，将循环标志flag设置为0。
% 最后，将大于阈值的像素索引ind1作为二值图像bw输出，将最终的阈值T1作为阈值th输出。