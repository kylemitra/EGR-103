%Kyle Mitra
%I understand and have adhered to all the tenets of the Duke
%Community Standard in the creation of this code.
%Signed: km423

clear; format short e
load Table17p20.mat

%a
A1 = interp2(x,y,T,4,3.2, 'nearest')
A2 = interp2(x,y,T,4,3.2, 'linear')
A3 = interp2(x,y,T,4,3.2, 'spline')

%b
B1 = interp2(x,y,T,4.3,2.7, 'nearest')
B2 = interp2(x,y,T,4.3,2.7,'linear')
B3 = interp2(x,y,T,4.3,2.7, 'spline')

[XVals, YVals] = meshgrid(linspace(0,8,17));

figure(1);clf
surfc(x,y,T)
colormap copper 
view (142.5 , 30)
print -dpng Chapra1720a

figure(2);clf
TVals = interp2(x,y,T,XVals,YVals, 'nearest');
surfc(XVals, YVals, TVals)
colormap copper 
view (142.5 , 30)
print -dpng Chapra1720b

figure(3);clf
TVals2 = interp2(x,y,T,XVals,YVals, 'linear');
surfc(XVals, YVals, TVals2)
colormap copper 
view (142.5 , 30)
print -dpng Chapra1720c

figure(4);clf
TVals3 = interp2(x,y,T,XVals,YVals, 'spline');
surfc(XVals, YVals, TVals3)
colormap copper 
view (142.5 , 30)
print -dpng Chapra1720d
