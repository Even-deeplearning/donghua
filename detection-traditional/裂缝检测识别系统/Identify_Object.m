function bwn = Identify_Object(bw, MinArea, MinRate)
if nargin < 3    
    MinRate = 3; 
end
if nargin < 2
    MinArea = 5;
end
[L, num] = bwlabel(bw); 
stats = regionprops(L, 'Area', 'MajorAxisLength', ...
    'MinorAxisLength'); 
Ap = cat(1, stats.Area);
Lp1 = cat(1, stats.MajorAxisLength);
Lp2 = cat(1, stats.MinorAxisLength); 
Lp = Lp1./Lp2; 
for i = 1 : num
    if Ap(i) < MinArea
        bw(L == i) = 0;
    end
end
MinRate = max(Lp)*0.4;
for i = 1 : num
    if Lp(i) < MinRate
        bw(L == i) = 0;
    end
end
bwn = bw;
% 这段代码是一个用于识别二值图像中物体的函数，根据物体的面积和长宽比进行筛选和删除。
% 这是一个用于识别目标对象的函数。函数的输入参数是二值图像bw，最小面积MinArea和最小长宽比MinRate（可选参数）。
% 首先，函数检查是否提供了最小长宽比MinRate和最小面积MinArea的值。如果没有提供，则使用默认值3和20。
% 接下来，使用bwlabel函数对二值图像bw进行标记连通区域操作，将连通区域的标签存储在矩阵L中，并返回连通区域的数量num。
% 然后，使用regionprops函数计算每个连通区域的面积（Area）、主轴长度（MajorAxisLength）和次轴长度（MinorAxisLength），并将结果存储在stats结构体数组中。
% 接着，将面积（Ap）、主轴长度（Lp1）、次轴长度（Lp2）分别存储在矩阵Ap、Lp1和Lp2中，然后计算每个连通区域的长宽比Lp。
% 然后，对于每个连通区域，如果其面积小于最小面积MinArea，则将该连通区域对应的像素置为0，即从二值图像bw中去除该连通区域。
% 接着，重新计算最小长宽比MinRate，取所有连通区域的长宽比的最大值的40%作为新的MinRate。
% 最后，对于每个连通区域，如果其长宽比Lp小于最小长宽比MinRate，则将该连通区域对应的像素置为0，即从二值图像bw中去除该连通区域。
% 最终，函数返回处理后的二值图像bwn，其中去除了面积小于最小面积和长宽比小于最小长宽比的连通区域。
