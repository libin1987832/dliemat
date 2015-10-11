function y = se3_log(x)

R = x(1:3,1:3);
t = x(1:3,4);

% first log of R
theta = acos((trace(R)-1)/2);
A = sinc(theta);
if abs(theta) < 1e-10
    B = 0.5;
else
    B = (1-cos(theta))/(theta*theta);
end
SO = (1/(2*A))*(R-R');  % =skew(omega)
omega = [SO(3,2) SO(1,3) SO(2,1)];
                                   
iV = eye(3) - 1/2*SO + 1/2/(theta^2)*(1 - A/2/B)*SO^2; % use directly skew of omega
u = iV*t;

y = [omega,u(:)'];