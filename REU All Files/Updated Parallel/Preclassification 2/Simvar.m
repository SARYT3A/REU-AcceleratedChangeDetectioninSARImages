function [sim, var1, var2] = Simvar(in1, in2)

%in=input('enter preimage: ', 's');
IM1=double(in1);
[maxX,maxY]=size(IM1);
IM2 = double(in2);

sim = abs(IM1 - IM2) ./ (IM1 + IM2);
        
w1 = IM1 ./ (IM1 + IM2);
w2 = IM2 ./ (IM1 + IM2);
for i = 1:maxX
    for j = 1:maxY
        if IM1(i, j) == 0 && IM2(i, j) == 0
            sim(i, j) = 0;
            w1(i, j) = 0.5;
            w2(i, j) = 0.5;
        end
    end
end
G = (w1.*IM1) + (w2.*IM2);
var1 = w1 .* (IM1 - G).^2;
var2 = w2 .* (IM2 - G).^2;
end
