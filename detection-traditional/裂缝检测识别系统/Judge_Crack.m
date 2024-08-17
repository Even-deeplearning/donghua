function bwn = Judge_Crack(bw, Ig, th)
if nargin < 3
    th = 35; 
end
[L, num] = bwlabel(bw); 
Ig = im2uint8(mat2gray(Ig));
Ig = double(Ig);
stats = regionprops(L, 'Area', 'BoundingBox');
for i = 1 : num
    Ymin = round(stats(i).BoundingBox(1));
    Ymax = round(stats(i).BoundingBox(1) + stats(i).BoundingBox(3));
    Xmin = round(stats(i).BoundingBox(2));
    Xmax = round(stats(i).BoundingBox(2) + stats(i).BoundingBox(4));
    sum1(i) = 0; 
    for k1 = Xmin : Xmax-1
        for k2 = Ymin : Ymax-1
            sum1(i) = sum1(i) + Ig(k1, k2);
        end
    end
    RectArea(i) = stats(i).BoundingBox(3)*stats(i).BoundingBox(4);
    Average1(i) = sum1(i)/RectArea(i); 
    [r, c] = find(L == i);
    Ln(i) = length(find(L==i));
    for j = 1 : Ln(i)
        gv(i, j) = Ig(r(j), c(j));
    end
    sum2(i) = sum(gv(i, :));
    Average2(i) = sum2(i)/Ln(i);
    Sub(i) = abs(Average1(i) - Average2(i));
    if Sub(i) < th
        bw(find(L==i)) = 0;
    end
end
bwn = bw;
% 该函数用于判断是否有裂缝存在。函数的输入参数有三个，bw为二值图像，Ig为灰度图像，th为阈值，默认为20。
% 函数首先将二值图像进行标记，然后计算每个标记区域的平均灰度值，并与该区域内像素的平均灰度值进行比较。
% 如果差值小于阈值，则将该区域内的像素置为0。最后，返回处理后的二值图像。