function err = runge_err(a, dx, dt, L, p0, p1, ban)
   X = 0:dx:1000;
  T = 0.001:dt:365;
  M = length(X);
  N = length(T);
  if ban == "ex"
    P_hu = explit(a, dx/2, dt/2, L, p0, p1);
    P=explit(a, dx, dt, L, p0, p1);
  elseif ban == "im"
    P_hu = implicit(a, dx/2, dt/2, L, p0, p1);
    P = implicit(a, dx, dt, L, p0, p1);
  endif
temp = zeros(M, N);
for j = 1:(N-1)
  for i = 1:(M-1)
    temp(i, j) = P_hu(2*i, 2*j);
  endfor
endfor
err = abs(P - temp)/(2^2 - 1);
end