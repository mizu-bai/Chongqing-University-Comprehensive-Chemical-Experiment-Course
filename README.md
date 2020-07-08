# Chongqing-University-Comprehensive-Chemical-Experiment-Course

重庆大学综合化学实验数据处理方案

## 简介

在上次仪器分析实验之后，开了一门综合化学实验，这次的实验数据处理方案不像上次一样在结课后才放出，按笔者的上课时间实时更新。

## 实验内容

笔者在学习此课程时，使用的教材为《综合化学实验汇编》，由化学化工学院基础化学教学实验中心编写，编写时间为2020年1月。

本书中的实验如下所示：

> * 实验1 L-脯氨酸催化硝基苯甲醛与丙酮的不对称aldol反应
> * 实验2 交联羧甲基纤维素的制备及对亚甲基蓝的吸附性能研究
> * 实验3 电化学振荡反应在可溶性氯化物氯含量测定中的应用
> * 实验4 聚苯胺的电化学制备及性能表征和应用
> * 实验5 $$ YB{O}_{3}: {Ce}^{3+} $$及$$ YB{O}_{3}: {Ce}^{3+}/{Tb}^{3+} $$荧光粉的固相制备和发光性能测试
> * 实验6 氮化碳量子点模拟酶性质研究及检测血清中谷胱甘肽的含量 

其中除实验1外，其他的数据都需要进行处理。

## 使用方法

`clone`此项目后，将其中的`*.m`文件移动到你的`MATLAB`工作路径，即可在`MATLAB`运行这些代码。请将原始数据改为你自己的（在注释中有提示），也可以先直接运行看看效果。

## 运行环境

笔者的运行环境如下：

> * OS Version: macOS Mojave 10.14.6 (18G5033)
> * MATLAB Version: 9.4.0.813654 (R2018a)

通常来讲在`Windows`和`Linux`下的`MATLAB`中都能正常运行，但应注意，`table`数据结构是在`MATLAB R2013b`中引入的，这是最低版本限制。
