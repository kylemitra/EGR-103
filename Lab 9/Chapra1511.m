%Kyle Mitra
%I understand and have adhered to all the tenets of the Duke
%Community Standard in the creation of this code.
%Signed: km423

clear; format short e

I = [50,80,130,200,250,350,450,550,700];
I = I(:);
P = [99,177,202,248,229,219,173,142,72];
P = P(:);

yeqn = @(coefs, I) coefs(1).*((I.^1)./coefs(2)).*exp((-I.^1)./(coefs(2))+1);
InitGuess = [248 200];

fSSR = @(coefs, I, P) sum((P-yeqn(coefs,I)).^2);
[MyCoefs, Sr] = fminsearch(@(MyCoefsDummy) fSSR(MyCoefsDummy, I, P), InitGuess)

figure(1);clf
plot(I,P,'k-', I,P,'rd')
%title and labels

yhat = yeqn(MyCoefs, I);
St = sum((P - mean(P).^2))
r2 = (St -Sr) / St