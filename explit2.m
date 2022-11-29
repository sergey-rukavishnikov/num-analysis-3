function P = explit2(a, dx, dt, L, p0, coeff)
x = 0:dx:L;
t = 0.0001:dt:365;
M = length(x);
N = length(t);
P = zeros(M, N);
P(:, 1) = p0;
P(M, :) = p0;
g = ((dt*a)/power(dx, 2));
for j = 1:N-1
  for i = 2:M-1
    if (i == 2)
      P(i, j + 1) = g * (P(i+1, j) - P(i, j)) + P(i, j) - g * coeff * dx;
      else
    P(i, j+1) = g*(P(i+1, j) + P(i-1,j)) + (1 - 2 * g) * P(i, j);
    endif
  endfor
endfor
for j = 1:N-1
  P(1, j+1) = (P(2, j+1) - P(2, j))/g + 2*P(2, j+1) - P(3, j+1);
  endfor
end
