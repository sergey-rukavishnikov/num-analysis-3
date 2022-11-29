function P = implicit2(a, dx, dt, L, p0, coeff)
  X = 0:dx:L;
  T = 0.0001:dt:365;
  M = length(X);
  N = length(T);
  P = zeros(M, N);
  P(:, 1) = p0;
  P(M, :) = p0;
  g = ((dt*a)/power(dx, 2));
  A = zeros(M - 2, M - 2);
  for i = 3:M - 3
    A(i, i) = -(1+2*g);
    A(i, i-1) = g;
    A(i, i+1) = g;
  endfor
A(2, 2) = -(1+g);
A(2, 1) = g;
A(2, 3) = 0;
A(1,1) = -(1+2*g);
A(1,2) = g;
A(M-2, M-2) = -(1+2*g);
A(M-2, M-3) = g;
A
for j = 1:N-1
  B = zeros(M-2, 1);
  B(2) = - P(i, j) + g*dx*coeff;
  for i = 3:M-1
    B(i-1) = -P(i,j);
  endfor
B(1) = B(1) - P(1, j+1)*g;
B(M-2) = B(M-2) - P(M, j+1)*g;
yy = A\B;
B
P(2:M-1, j+1) =yy';
P(1, j+1) = (P(2, j+1) - P(2, j))/g + 2*P(2, j+1) - P(3, j+1);
endfor
end
