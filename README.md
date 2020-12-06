# Cardiac-Spiral

This  code is based on Dwight Barkley Model. \
Reference website：
http://www.thevirtualheart.org/webgl/DS_SIAM/barkley.html

## How to generate parallel and circular waves

Filename : *getSteadyStateWave.m*

```matlab
for k = 1 : length(t)
%Add your stimulus here
	for i = 1 : nx
        for j = 1 : ny
        
%%Stimulus:
%Parallel   like:u(1,1：end) = S
%Circular   like: u(pointx,pointy) = S
```
![PC](https://raw.githubusercontent.com/Tikmoing/Cardiac-Spiral-Wave-BDM/main/images/PC.jpg)

## How to generate spiral waves:

FileName : *getScrewAndEliminate.m*

   Only a series of traveling waves need to be generated, and half of them will be erased when they reach the middle, and the remaining half can automatically evolve into spiral waves.

```matlab
       if( abs(t(k) - 26.964000000000000) < 1e-4)
            u(169 - 20 : 169 + 20,floor(nx/2):end) = 0;
       end
```

![Spiral](https://raw.githubusercontent.com/Tikmoing/Cardiac-Spiral-Wave-BDM/main/images/Spiral.jpg)

## Spatiotemporal chaos:

Filename : *getChaosAndEliminate.m*

   The particularity of the model makes the spiral wave evolve into spatiotemporal chaos only by changing the parameter value.

```matlab
eps = 0.12;
```


## Elimination of spiral wave and chaos by traveling wave method:

   The code for this procedure is in the above file and will not be discussed in detail here
