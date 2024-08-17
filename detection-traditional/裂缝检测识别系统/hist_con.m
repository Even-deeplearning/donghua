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
    subplot(2, 2, 1); imshow(I); title('ԭͼ');
    subplot(2, 2, 2); imhist(I); title('ԭͼֱ��ͼ');
    subplot(2, 2, 3); imshow(s_out); title('���⻯���');
    subplot(2, 2, 4); imhist(s_out); title('���⻯���ֱ��ͼ');
end
% ����һ������ֱ��ͼ���⻯�ĺ�����������������һ���Ҷ�ͼ��s_in��һ����ѡ����flag�����������ж�����ͼ���ά�ȣ�����ǲ�ɫͼ����ʹ��rgb2gray��������ת��Ϊ�Ҷ�ͼ��
% Ȼ��ʹ��histeq�����ԻҶ�ͼ�����ֱ��ͼ���⻯��������洢��s_out�С�
% ���flag����Ϊ�棬�򴴽�һ��ͼ�񴰿ڣ���ʹ��subplot�����ڴ����д���һ��2��2�е���ͼ����
% �ڵ�һ����ͼ�У�ʹ��imshow������ʾԭͼ��I������ӱ��⡣�ڵڶ�����ͼ�У�ʹ��imhist������ʾԭͼ���ֱ��ͼ��
% �ڵ�������ͼ�У�ʹ��imshow������ʾ���⻯���ͼ��s_out������ӱ��⡣�ڵ��ĸ���ͼ�У�ʹ��imhist������ʾ���⻯��ͼ���ֱ��ͼ��