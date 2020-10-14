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

% Simpson's Hint
for k=1:N
     if k==1
          simpint(k)=0;
     elseif k==2
          simpint(k)=0;
     elseif k==3
          simpint(k)=0;
     elseif k==4
          simpint(k)=0;
     elseif 1==1 % replace 1==1 with code to see if k is odd
          simpint(k)=0;
     else % if you are here, k is even and >4
          simpint(k)=0;
     end
end

%% Leave the code below intact - saves the data into the appropriate file
%  This must be in place for the GraderCode and CheckerCode to work!
eval(sprintf('save Soln_%s', ArgIn'))
