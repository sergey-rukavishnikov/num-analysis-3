clc
clear all
close all
#начальные условия
k=power(10, -12);
u=1.57*power(10, -11);
B=5*power(10,-4);
L=1000;
S=10000;
a=k/(u*B);
Q = 20;
coeff = (u*Q)/(k*S);
p0=10;
p1=5;
#задача
dx=100;
dt=35;
tau = (dx^2)/(2*a);
[X, T, Pan]=analit(a, dx, dt, L, p0, p1);
if (dt <= tau)
  Pex=explit(a, dx, dt, L, p0, p1);
else
  error("Разностная схема неустойчива")
endif
err=runge_err(a, dx, dt, L, p0, p1, "im");
Pim = implicit(a, dx, dt, L, p0, p1);
[x, y] = ndgrid(0:dx:L, 0:dt:365);
[x, t] = ndgrid(0:dx:L, 0.0001:dt:365);
Pan2 = analit_Q(a, coeff, dx, dt, L, p0);
Pex2 = explit2(a, dx, dt, L, p0, coeff);
Pim2 = implicit2(a, dx, dt, L, p0, coeff);
mesh(x, t, Pan2)
figure
mesh(x, t, Pex2)
figure
mesh(x, t, Pim2)
Pim2
Pan2
