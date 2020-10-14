%Kyle Mitra
%I understand and have adhered to all the tenets of the Duke
%Community Standard in the creation of this code.
%Signed: km423

clear; format short e

t = [0.5,1,2,3,4,5,6,7,9];
t = t(:);
PVals = [6,4.4,3.2,2.7,2,1.9,1.7,1.4,1.1];
PVals = PVals(:);

p = @(coefs, t) coefs(1)*exp(1.5.*t) + coefs(2)*exp(-0.3.*t) + coefs(3)*exp(-0.2.*t);
A = [exp(1.5.*t) exp(-0.3.*t) exp(-0.05.*t)];

MyCoefs = A\PVals

XVals = linspace(0.5,9,100);

figure(1); clf
plot(t,PVals, 'k-', t, PVals, 'b+')
%title and labels

figure(2);clf
% plot(XVals, MyCoefs(1), 'k-', ...
%     XVals, MyCoefs(2), 'k--', ...
%     XVals, MyCoefs(3), 'k-.')
%FIGURE THIS PART OUT

yhat = yeqn(MyCoefs, t);
St = sum((PVals - mean(PVals).^2))
Sr = sum((PVals - yhat).^2)
r2 = (St -Sr) / St