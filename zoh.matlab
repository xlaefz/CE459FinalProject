% CE 459 Final proiect - Piecewise constant approximation
% w = natural frequency
% z = damping ratio
% t = time vector
% p = force vector
% x0 = initial displacement
% v0 = initial velocity

%using zoh fn returns an array [x,v]
function [x,v] = zoh(w, z, t, p, x0, v0)
	
	if nargin < 5
		x0 = 0;
		v0 = 0;
	elseif nargin >= 5
		v0 = 0
	end

	%number of iternations that need to be run
	n = length(t);

	%sCalculation for the time steps and notes
	dt = t(2)-t(1);
	wd = w*sqrt(1-z^2);
	k = w^2;

	%constants referenced from the book
	mWDT = w*dt;
	mWDDT = wd*dt;
	mZWDT = -z*w*dt;
	A = exp(mZWDT)*(cos(mWDDT)+z/sqrt(1-z^2)*sin(mWDDT));
	B = exp(mZWDT)*(1/wd*sin(mWDDT));
	C = 1/k*(1-exp(mZWDT)*(z/sqrt(1-z^2)*sin(mWDDT)+cos(mWDDT)));
	A1 = exp(mZWDT)*(-w/sqrt(1-z^2)*sin(mWDDT));
	B1 = exp(mZWDT)*(cos(mWDDT)-z/sqrt(1-z^2)*sin(mWDDT));
	C1 = exp(mZWDT)*(1/k)*(w/sqrt(1-z^2)*sin(mWDDT));
	x=zeros(n,1); x(1)=x0;
	v=zeros(n,1); v(1)=v0;

	%execute calcuations
	for i = 1:(n-1)
	 x(i+1) = A*x(i)+B*v(i)+C*p(i);
	 v(i+1) = A1*x(i)+B1*v(i)+C1*p(i);
	end
end