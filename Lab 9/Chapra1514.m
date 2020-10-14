%I understand and have adhered to all the tenets of the Duke
%Community Standard in the creation of this code.
%Signed: km423

clear; format short e

ConS = [0.01, 0.05, 0.1, 0.5, 1, 5, 10, 50, 100];
ConS = ConS(:);
Vo = [6.078e-11, 7.595e-9, 6.063e-8, 5.788e-6, 1.737e-5, 2.423e-5, 2.430e-5, 2.431e-5, 2.431e-5];
Vo = Vo(:);


yeqn = @(coefs, ConS) coefs(1)*(ConS.^3) .* (1./(coefs(2)+(ConS.^3)));
InitGuess = [2.431e-5 1];

fSSR = @(coefs, ConS, Vo) sum((Vo-yeqn(coefs,ConS)).^2);
[MyCoefs, Sr] = fminsearch(@(MyCoefsDummy) fSSR(MyCoefsDummy, ConS, Vo), InitGuess)

Xvals = linspace(0.01,100,100)

figure(1);clf
plot(ConS, Vo, 'k-', ConS, Vo, 'ro')
print -depsc Chapra1514

figure(2);clf
loglog(ConS, Vo, 'k-', ConS, Vo, 'ro')
print -depsc Chapra1514log