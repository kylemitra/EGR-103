%Kyle Mitra
%I understand and have adhered to all the tenets of the Duke
%Community Standard in the creation of this code.
%Signed: km423

clear; format short e
x = 0:0.1:1;
fx = humps(x);

XVals = linspace(0,1,1000);
yy = spline(x, fx, XVals);
yh = humps(XVals);
yy2 = pchip(x, fx, XVals);

figure(1);clf
hold on
plot(x, fx, 'k-')
plot(x, fx, 'ko')
plot(XVals, yy, 'r:')
plot(XVals, yy2, 'b--')

print -dpng Chapra480