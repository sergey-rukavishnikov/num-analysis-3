function P = analit_Q(a, coeff, dx, dt, L, p0)
x = 0:dx:L;
t = 0.0001:dt:365;
M = length(x);
N = length(t);
P = zeros(M, N);
for j = 1:N
  for i = 1:M
  P(i, j) = p0 + coeff * (x(i)*(1-erf(x(i)/(2*sqrt(a*t(j))))) - 2*sqrt((a*t(j))/3.14)*exp(-(x(i)^2)/(4*a*t(j))));
  endfor
endfor
end
