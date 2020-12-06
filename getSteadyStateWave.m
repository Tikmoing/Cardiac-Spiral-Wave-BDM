% getSteadyStateWave.m
clean

%% Constant
eps = 0.02; 
b = 0.07;
a = 0.84;

utf = @(ui,vi,eps) -ui.*(ui-1).*(ui - (vi + b ) ./ a) ./ eps;
vtf = @(ui,vi) vhavef(ui) - vi;

h = 0.6;
tau = h^2 ./ 20;
x = 0 : h : 200;
y = 0 : h : 200;
nx = length(x);ny = length(y);
t = 0 : tau : 400;

u = zeros(nx,ny);
v = zeros(nx,ny);

%% Operate
for k = 1 : length(t)
    %plane Wave
%     u(1,1:end) = 0.6;
%     u(1:end,1) = 0.6;
    %Annular wave
%    u(floor(nx/2),floor(ny/2)) = 0.6;
%% operate for the function
    for i = 1 : nx
        for j = 1 : ny
            if(i == 1 && j == 1)
                u(i,j) = u(i,j) + (( 2*u(i+1,j) + 2*u(i,j+1) - 4*u(i,j)) ./ h.^2  + utf(u(i,j),v(i,j),eps) ).*tau;
                v(i,j) = v(i,j) + (( 2*v(i+1,j) + 2*v(i,j+1) - 4*v(i,j)) ./ h.^2  + vtf(u(i,j),v(i,j))).*tau;
            elseif(i == nx && j == 1)
                u(i,j) = u(i,j) + (( 2*u(i-1,j) + 2*u(i,j+1) - 4*u(i,j)) ./ h.^2  + utf(u(i,j),v(i,j),eps) ).*tau;
                v(i,j) = v(i,j) + (( 2*v(i-1,j) + 2*v(i,j+1) - 4*v(i,j)) ./ h.^2  + vtf(u(i,j),v(i,j))).*tau;
            elseif(i == 1 && j == ny)
                u(i,j) = u(i,j) + (( 2*u(i+1,j) + 2*u(i,j-1) - 4*u(i,j)) ./ h.^2  + utf(u(i,j),v(i,j),eps)).*tau;
                v(i,j) = v(i,j) + (( 2*v(i+1,j) + 2*v(i,j-1) - 4*v(i,j)) ./ h.^2  + vtf(u(i,j),v(i,j))).*tau;
            elseif(i == nx && j == ny)
                u(i,j) = u(i,j) + (( 2*u(i-1,j) + 2*u(i,j-1) - 4*u(i,j)) ./ h.^2  + utf(u(i,j),v(i,j),eps)).*tau;
                v(i,j) = v(i,j) + (( 2*v(i-1,j) + 2*v(i,j-1) - 4*v(i,j)) ./ h.^2  + vtf(u(i,j),v(i,j))).*tau;
            elseif(i == 1)
                u(i,j) = u(i,j) + (( 2*u(i+1,j) + u(i,j-1) + u(i,j+1) - 4*u(i,j)) ./ h.^2  + utf(u(i,j),v(i,j),eps) ).*tau;
                v(i,j) = v(i,j) + (( 2*v(i+1,j) + v(i,j-1) + v(i,j+1) - 4*v(i,j)) ./ h.^2  + vtf(u(i,j),v(i,j))).*tau;
            elseif(j == 1)
                u(i,j) = u(i,j) + (( 2*u(i,j+1) + u(i-1,j) + u(i+1,j) - 4*u(i,j)) ./ h.^2  + utf(u(i,j),v(i,j),eps)).*tau;
                v(i,j) = v(i,j) + (( 2*v(i,j+1) + v(i-1,j) + v(i+1,j) - 4*v(i,j)) ./ h.^2  + vtf(u(i,j),v(i,j))).*tau;
            elseif(i == nx)
                u(i,j) = u(i,j) + (( 2*u(i-1,j) + u(i,j-1) + u(i,j+1) - 4*u(i,j)) ./ h.^2  + utf(u(i,j),v(i,j),eps)).*tau;
                v(i,j) = v(i,j) + (( 2*v(i-1,j) + v(i,j-1) + v(i,j+1) - 4*v(i,j)) ./ h.^2  + vtf(u(i,j),v(i,j))).*tau;
            elseif(j == ny)
                u(i,j) = u(i,j) + (( 2*u(i,j-1) + u(i-1,j) + u(i+1,j) - 4*u(i,j)) ./ h.^2  + utf(u(i,j),v(i,j),eps)).*tau;
                v(i,j) = v(i,j) + (( 2*v(i,j-1) + v(i-1,j) + v(i+1,j) - 4*v(i,j)) ./ h.^2  + vtf(u(i,j),v(i,j))).*tau;
            else
                u(i,j) = u(i,j) + (( u(i,j-1) + u(i,j+1) + u(i-1,j) + u(i+1,j) - 4*u(i,j)) ./ h.^2  + utf(u(i,j),v(i,j),eps)).*tau;
                v(i,j) = v(i,j) + (( v(i,j-1) + v(i,j+1) + v(i-1,j) + v(i+1,j) - 4*v(i,j)) ./ h.^2  + vtf(u(i,j),v(i,j))).*tau;
            end
            
        end
        

    end


    %% plot
    image(x,y,u','CDataMapping','scaled');
    axis xy;
    colormap Copper
    titlepush = "t = " + t(k);
    title(titlepush);
    pause(0.01);

end

%% function

function res = vhavef(u)
    if(0<= u && u < 1/3)
        res = 0;
    elseif(u > 1/3 && u <= 1)
        res = 1 - 6.75.*u.*(u-1).^2;
    else
        res = 1;
    end
end