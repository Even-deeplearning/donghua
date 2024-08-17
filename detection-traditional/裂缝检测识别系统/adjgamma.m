function newim = adjgamma(im, g)
if nargin < 2
    g = 1;
end

if g <= 0
    error('Gamma�����������0');
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

% �ú������ڶ�����ͼ�����٤��У������
% ���������
% im������ͼ�񣬿����ǻҶ�ͼ����ɫͼ��
% g��٤�������Ĭ��ֵΪ1��

% ���������
% newim������٤��У��������ͼ��

% ����ʵ�ֵ���Ҫ�������£�
% �ж�����������Ƿ����٤�����g�����û����g��Ϊ1��
% �ж�����ͼ���ά�ȣ�����ǲ�ɫͼ������ת��Ϊ�Ҷ�ͼ��I��
% ���Ҷ�ͼ��Iת��Ϊ˫����ͼ��newim��
% ��newim������Сֵ���㻯�����ֵ��һ������ʹ����ֵ��Χ��0��1֮�䡣
% �Թ�һ�����newim����٤��У������ʹ�ù�ʽnewim = newim^(1/g)��
% ���ؾ���٤��У��������ͼ��newim��
