function newim = adjgamma(im, g)
if nargin < 2
    g = 1;
end

if g <= 0
    error('Gamma参数必须大于0');
end
if ndims(im) == 3
    I = rgb2gray(im);
else
    I = im;
end
if isa(I,'uint8');
    newim = double(I);
else
    newim = I;
end
newim = newim-min(min(newim));
newim = newim./max(max(newim));
newim =  newim.^(1/g);  

% 该函数用于对输入图像进行伽马校正处理。
% 输入参数：
% im：输入图像，可以是灰度图像或彩色图像。
% g：伽马参数，默认值为1。

% 输出参数：
% newim：经过伽马校正处理后的图像。

% 函数实现的主要步骤如下：
% 判断输入参数中是否包含伽马参数g，如果没有则将g设为1。
% 判断输入图像的维度，如果是彩色图像则将其转换为灰度图像I。
% 将灰度图像I转换为双精度图像newim。
% 对newim进行最小值归零化和最大值归一化处理，使像素值范围在0到1之间。
% 对归一化后的newim进行伽马校正处理，使用公式newim = newim^(1/g)。
% 返回经过伽马校正处理后的图像newim。
