%Kyle Mitra
%I understand and have adhered to all the tenets of the Duke
%Community Standard in the creation of this code.
%Signed: km423

clear; format short e

load DOCtable.mat;

c2 = c(:);
T2 = T(:);
OC2 = OC(:);
[cModel, TModel] = meshgrid(...
    linspace(min(c2), max(c2), 17), ...
    linspace(min(T2), max(T2), 19));
    
yeqn = @(coefs, c, T) coefs(1)*c.^0 + coefs(2)*c + coefs(3)*T + coefs(4)*(T.^2) + coefs(5)*(T.^3);
A = [c2.^0 c2 T2 T2.^2 T2.^3];

MyCoefs = A\OC2

yhat = yeqn(MyCoefs, c2, T2);
ymodel = yeqn(MyCoefs, cModel, TModel);

St = sum((OC2 - mean(OC2).^2))
Sr = sum((OC2 - yhat).^2)
r2 = (St -Sr) / St

figure(1); clf
surfc(c,T,OC);
xlabel('c'); ylabel('T'); zlabel('z'); title('(km423)')
view(145, 15)
colormap autumn
print -depsc Chapra157

Estimates = yeqn(MyCoefs, 15, 12)
%Error = CALCULATE ERROR

    