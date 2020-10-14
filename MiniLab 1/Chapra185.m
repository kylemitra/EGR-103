%Kyle Mitra
%I understand and have adhered to all the tenets of the Duke
%Community Standard in the creation of this code.
%Signed: km423

clear; format short e
x = [-1, -0.6, -0.2, 0.2, 0.6, 1];
fx = (1.0)*(x>=0);

XVals = linspace(-1,1,1000);
fx2 = (1.0)*(XVals>=0);
yy = spline(x, fx, XVals);
yc = [0 fx 0];
yy2 = spline(x, yc, XVals);
yy3 = pchip(x, fx, XVals);

figure(1);clf
subplot(3,1,1)
hold on
plot(XVals, fx2, 'k--')
plot(x, fx, 'ko')
plot(XVals,yy,'b-')
axis([-1 1 -0.5 1.5])

subplot(3,1,2)
hold on
plot(XVals, fx2, 'k--')
plot(x, fx, 'ko')
plot(XVals, yy2, 'b-')
axis([-1 1 -0.5 1.5])

subplot(3,1,3)
hold on
plot(XVals, fx2, 'k--')
plot(x, fx, 'ko')
plot(XVals, yy3, 'b-')
axis([-1 1 -0.5 1.5])

print -dpng Chapra185