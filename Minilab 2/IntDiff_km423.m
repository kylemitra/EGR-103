function IntDiff_ID(ArgIn)
%% Leave the code below intact - makes your user ID default
%  This must be in place for the GraderCode to work!
if nargin==0
    [s, m] = unix('echo $USER');
    if m(1)=='['
        EOL = find(m==10);
        m = m((EOL(1)+1):(EOL(2)-1));
    else
        m = m(1:(end-1));
    end
    ArgIn = m;
end
DataFile = sprintf('Data_%s', ArgIn)
load(DataFile)

%% Pre-load zeros so checker works
%  Leave the entries below to create 1x1
%  matrices for all six required arrays
%  until you have written code for them
%  Be sure to use these exact names!
dydt2F   = 0; % 2-point  forward  first derivative
dydt2B   = 0; % 2-point backward  first derivative
dydt3C   = 0; % 2-point centered  first derivative
d2ydt23C = 0; % 3-point centered second derivative
trapint  = 0; % Integral using trapezoidal rule everywhere
simpint  = 0; % Integral using hybrid Simpson's rule

%% start of solutions
%  Use t and y as variables - given in data file loaded above
%  May want to get dt and N early
dt = t(2)-t(1);
N = length(y);

% Put your code for calculating various items here
for k = 1:(N-1)
    dydt2F(k) = (y(k+1)-y(k))./dt;     % 2-point  forward  first derivative
end
dydt2F(N) = (y(N)-y(N-1))./dt;
for k = 2:N
    dydt2B(k) = (y(k)-y(k-1))./dt; % 2-point backward  first derivative
end
dydt2B(1) = (y(2)-y(1))./dt;
for k = 2:(N-1)
    dydt3C(k)   = (y(k+1)-y(k-1))./(2.*dt); % 2-point centered  first derivative
    d2ydt23C(k) = (y(k+1)-2.*y(k)+y(k-1))./(dt.^2); % 3-point centered second derivative
end
dydt3C(1) = (-y(3)+4.*y(2)-3.*y(1))./(2.*dt);
dydt3C(N) = (3.*y(N)-4.*y(N-1)+y(N-2))./(2.*dt);
d2ydt23C(1) = (y(3)-2.*y(2)+y(1))./(dt.^2);
d2ydt23C(N) = (y(N)-2.*y(N-1)+y(N-2))./(dt.^2);
for k=4:N
    trapint(k)  = (dt./2).*(y(1)+2.*(sum(y(2:(k-1))))+y(k)); % Integral using trapezoidal rule everywhere
end
trapint(1) = 0;
trapint(2) = (dt./2).*(y(1)+y(2));
trapint(3) = (dt./2).*(y(1)+2.*y(2)+y(3));

% Simpson's Hint
for k=1:N
     if k==1
          simpint(k)=0;
     elseif k==2
          simpint(k)=(dt./2).*(y(1)+y(2));
     elseif k==3
          simpint(k)=(dt./3).*(y(1)+4.*y(2)+y(3));
     elseif k==4
          simpint(k)=((3.*dt)./8).*(y(1)+3.*y(2)+3.*y(3)+y(4));
     elseif mod(k,2) == 1 % replace 1==1 with code to see if k is odd
         simpint(k)=(dt./3).*(y(1)+4.*sum(y(2:2:(k-1)))+2.*sum(y(3:2:(k-2)))+y(k));
     else % if you are here, k is even and >4
         simpint(k)= (dt./3).*(y(1)+4.*(sum(y(2:2:(k-4))))+2.*(sum(y(3:2:(k-5))))+y(k-3))+((3.*dt)./8).*(y(k-3)+3.*y(k-2)+3.*y(k-1)+y(k));
     end
end

%% Leave the code below intact - saves the data into the appropriate file
%  This must be in place for the GraderCode and CheckerCode to work!
eval(sprintf('save Soln_%s', ArgIn'))
