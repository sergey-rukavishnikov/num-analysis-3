function [X, T, P] = analit(a, dx, dt, L, p0, p1)
  X = 0:dx:L;
  T = 0.001:dt:365;
  M = length(X);
  N = length(T);
  P = zeros(M, N);
  for j = 1:N
    for i = 1:M
      P(i, j) = p1+(p0 - p1)*erf(X(i)/(2*sqrt(a*T(j))));
    endfor
  endfor
end