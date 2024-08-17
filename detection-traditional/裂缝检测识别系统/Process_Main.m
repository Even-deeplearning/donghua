function Result = Process_Main(I) 
% 判断输入图像的维度，如果为彩色图像则转化为灰度图像
if ndims(I) == 3
    I1 = rgb2gray(I);
else
    I1 = I;
end
% 直方图均衡化
I2 = hist_con(I1);
% 中值滤波
I3 = med_process(I2);
% gamma校正,2为增强度，越大越强
I4 = adjgamma(I3, 3);
% 迭代法二值化
[bw, th] = IterProcess(I4);
% 反转二值图像
bw = ~bw;
% 对二值图像进行滤波，参数值为15表示使用一个大小为15x15的滤波器进行滤波操作。
% 较大的滤波器大小可以平滑图像并去除噪声，但也可能导致细节的损失。选择适当的滤波器大小需要根据具体应用和图像特点进行调整。
bwn1 = bw_filter(bw, 20);
% 标记并提取目标物体
bwn2 = Identify_Object(bwn1);
% 求取水平和垂直投影
[projectr, projectc] = Project(bwn2);
[r, c] = size(bwn2);
% 判断裂缝类型
bwn3 = Judge_Crack(bwn2, I4);
% 桥接裂缝
bwn4 = Bridge_Crack(bwn3);
% 判断裂缝走向
[flag, rect] = Judge_Direction(bwn4);
% 根据裂缝走向确定结果
if flag == 1
    str = '横向形状的裂缝';
    wdmax = max(projectc);
    wdmin = min(projectc);
else
    str = '纵向形状的裂缝';
    wdmax = max(projectr);
    wdmin = min(projectr);
end
% 构造结果结构体
Result.Image = I1; 
Result.hist = I2; 
Result.Medfilt = I3; 
Result.Enance = I4;
Result.Bw = bw; 
Result.BwFilter = bwn1; 
Result.CrackRec = bwn2;
Result.Projectr = projectr;
Result.Projectc = projectc;
Result.CrackJudge = bwn3;
Result.CrackBridge = bwn4; 
Result.str = str;
Result.rect = rect;
Result.BwEnd = bwn4; 
Result.BwArea = bwarea(bwn4); 
Result.BwLength = max(rect(3:4));
Result.BwWidthMax = wdmax; 
Result.BwWidthMin = wdmin; 
Result.BwTh = th;