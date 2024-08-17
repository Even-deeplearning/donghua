function Result = Process_Main(I) 
% �ж�����ͼ���ά�ȣ����Ϊ��ɫͼ����ת��Ϊ�Ҷ�ͼ��
if ndims(I) == 3
    I1 = rgb2gray(I);
else
    I1 = I;
end
% ֱ��ͼ���⻯
I2 = hist_con(I1);
% ��ֵ�˲�
I3 = med_process(I2);
% gammaУ��,2Ϊ��ǿ�ȣ�Խ��Խǿ
I4 = adjgamma(I3, 3);
% ��������ֵ��
[bw, th] = IterProcess(I4);
% ��ת��ֵͼ��
bw = ~bw;
% �Զ�ֵͼ������˲�������ֵΪ15��ʾʹ��һ����СΪ15x15���˲��������˲�������
% �ϴ���˲�����С����ƽ��ͼ��ȥ����������Ҳ���ܵ���ϸ�ڵ���ʧ��ѡ���ʵ����˲�����С��Ҫ���ݾ���Ӧ�ú�ͼ���ص���е�����
bwn1 = bw_filter(bw, 20);
% ��ǲ���ȡĿ������
bwn2 = Identify_Object(bwn1);
% ��ȡˮƽ�ʹ�ֱͶӰ
[projectr, projectc] = Project(bwn2);
[r, c] = size(bwn2);
% �ж��ѷ�����
bwn3 = Judge_Crack(bwn2, I4);
% �Ž��ѷ�
bwn4 = Bridge_Crack(bwn3);
% �ж��ѷ�����
[flag, rect] = Judge_Direction(bwn4);
% �����ѷ�����ȷ�����
if flag == 1
    str = '������״���ѷ�';
    wdmax = max(projectc);
    wdmin = min(projectc);
else
    str = '������״���ѷ�';
    wdmax = max(projectr);
    wdmin = min(projectr);
end
% �������ṹ��
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