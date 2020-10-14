%Kyle Mitra
%I understand and have adhered to all the tenets of the Duke
%Community Standard in the creation of this code.
%Signed: km423

clear; format short e
x = [1 2 3 5 6];
y = [4.75 4 5.25 19.75 36];

Order1 = polyval(polyfit(x(3:4),y(3:4),1),4)
Order2a = polyval(polyfit(x(2:4),y(2:4),2),4)
Order2b = polyval(polyfit(x(3:5),y(3:5),2),4)
Order3 = polyval(polyfit(x(2:5),y(2:5),3),4)
Order4 = polyval(polyfit(x(1:5),y(1:5),4),4)