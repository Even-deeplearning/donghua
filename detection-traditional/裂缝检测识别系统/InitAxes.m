function InitAxes(handles)
clc;
axes(handles.axes1); cla reset;
set(handles.axes1, 'XTick', [], 'YTick', [], ...
    'XTickLabel', '', 'YTickLabel', '', 'Color', [0.7020 0.7804 1.0000], 'Box', 'On');
axes(handles.axes2); cla reset;
set(handles.axes2, 'XTick', [], 'YTick', [], ...
    'XTickLabel', '', 'YTickLabel', '', 'Color', [0.7020 0.7804 1.0000], 'Box', 'On');
axes(handles.axes3); cla reset;
set(handles.axes3, 'XTick', [], 'YTick', [], ...
    'XTickLabel', '', 'YTickLabel', '', 'Color', [0.7020 0.7804 1.0000], 'Box', 'On');
axes(handles.axes4); cla reset;
set(handles.axes4, 'XTick', [], 'YTick', [], ...
    'XTickLabel', '', 'YTickLabel', '', 'Color', [0.7020 0.7804 1.0000], 'Box', 'On');
% 这段代码是一个用于在GUI界面中初始化图像显示的Axes的函数。
% 具体的实现步骤如下：
% 使用clc函数清除命令行窗口的内容。
% 对handles中的axes1进行初始化设置，包括清除图像内容（cla reset）、设置X轴和Y轴刻度为空（'XTick', [], 'YTick', []
% ）、设置X轴和Y轴刻度标签为空（'XTickLabel', '', 'YTickLabel', ''）、设置背景颜色为[0.7020 0.7804 1.0000]、设置边框为On。
% 对handles中的axes2、axes3和axes4进行与步骤2相同的初始化设置。
% 总的来说，这段代码是一个用于在GUI界面中初始化图像显示的Axes的函数，通过设置各个Axes的属性，包括刻度、标签和背景颜色，来实现图像显示的初始化效果。
