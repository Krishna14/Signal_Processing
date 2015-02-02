% Function to generate a multi-step custom membership function
% using 8 parameters for the input argument x
function out = singletonmf(x, params)
for i=1:length(x)
if x(i)<params(1)
 y(i)=params(1);
elseif x(i)<params(2)
 y(i)=params(2);
elseif x(i)<params(3)
 y(i)=params(3);
elseif x(i)<params(4)
 y(i)=params(4);
elseif x(i)<params(5)
 y(i)=params(5);
elseif x(i)<params(6)
 y(i)=params(6);
elseif x(i)<params(7)
 y(i)=params(7);
elseif x(i)<params(8)
 y(i)=params(8);
else
 y(i)=0;
end
end
out=.1*y'; % scaling the output to lie between 0 and 1