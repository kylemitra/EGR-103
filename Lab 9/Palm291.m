%Kyle Mitra
%I understand and have adhered to all the tenets of the Duke
%Community Standard in the creation of this code.
%Signed: km423

clear; format short e

x = 1:10;
y = [10, 14, 16, 18, 19, 20, 21, 22, 23, 23];
x = x(:);
y = y(:);

yeqn = @(coefs, x) coefs(2).*(log(x.^1)) + coefs(1)*x.^0;
A = [x.^0 log(x.^1)];

MyCoefs = A\y

yhat = yeqn(MyCoefs, x);

St = sum((y- mean(y)).^2)
Sr = sum((y - yhat).^2)
r2 = (St-Sr) / St

x1 = yeqn(MyCoefs, 2.5)
x2 = yeqn(MyCoefs, 11)