# Cardiac-Spiral

This  code is based on Dwight Barkley Model.

## 产生平行波和靶波

文件：*getSteadyStateWave.m*

```matlab
for k = 1 : length(t)
%在此处加上你的刺激条件
	for i = 1 : nx
        for j = 1 : ny
        
%%条件
%平行波 例如：u(1,1：end) = S
%靶波   例如: u(pointx,pointy) = S
```

![image-20201204173504243_meidddtu_1](C:\Users\86177\Desktop\4\嘛\image-20201204173504243_meidddtu_1.jpg)

## 产生螺旋波：

文件：*getScrewAndEliminate.m*

只需要产生一列行波，传到中间时将它的一半给人为抹去，剩下一半就可以自动演化生成螺旋波。

```matlab
       if( abs(t(k) - 26.964000000000000) < 1e-4)
            u(169 - 20 : 169 + 20,floor(nx/2):end) = 0;
       end
```

结果展示：

![image-20201204173504顶顶顶243_meitu_1](C:\Users\86177\Desktop\4\嘛\image-20201204173504顶顶顶243_meitu_1.jpg)

## 时空混沌：

文件：*getChaosAndEliminate.m*

该模型的特殊性，让螺旋波演化生成时空混沌只需要改变参数值。

```matlab
eps = 0.12;
```

![ChaosReally](C:\Users\86177\Desktop\4\ChaosReally.png)

## 行波法消除螺旋波和混沌状态

在两个文件中都有