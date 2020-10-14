%Kyle Mitra
%I understand and have adhered to all the tenets of the Duke
%Community Standard in the creation of this code.
%Signed: km423

clear; format short e

x = [1,2,3,4,5];
x = x(:);
y = [2.2, 2.8, 3.6, 4.5, 5.5];
y = y(:);

yeqn = @(coefs, x) coefs(1)*x.^0 + coefs(2)*x + coefs(3)*(1./x);
A = [x.^0 x (1./x)];

MyCoefs = A\y

yhat = yeqn(MyCoefs, x);
St = sum((y - mean(y).^2))
Sr = sum((y - yhat).^2)
r2 = (St -Sr) / St

Prediction1 = yeqn(MyCoefs, 1.5)
Prediction2 = yeqn(MyCoefs, 4.5)
