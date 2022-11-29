function P=explit(a, dx, dt, L, p0, p1)
  X = 0:dx:L;
  T = 0:dt:365;
  M = length(X);
  N = length(T);
  P = zeros(M, N);
  P(:, 1) = p0;
  P(1, 2:N) = p1;
  P(M, :) = p0;
  g = ((dt*a)/power(dx, 2));
  for j=1:N - 1
    for i=2:M - 1
      P(i, j+1) = g*(P(i+1, j) + P(i-1,j)) + (1 - 2 * g) * P(i, j);
    endfor
  endfor
  end