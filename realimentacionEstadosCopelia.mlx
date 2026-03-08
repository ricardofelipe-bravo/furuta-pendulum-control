function dxdt = complex_rot_pend(t,x,flag,u)
% parametros del sistema
ma=0.6; % masa brazo [kg]
mp=0.2; % masa pendulo [kg]
la=1.1600e-1; % largo del brazo [m]
lp=3.0001e-1; % largo del pendulo [m]
j0=(ma*la^2)/3; %inercia brazo [kg m^2]
g=9.8;  % gravedad [m/s^-2]
j1=(mp*lp^2)/3; % inercia pendulo [kg m^2]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% x1: angulo del brazo
% x2: velocidad angular del brazo
% x3: angulo del pendulo
% x4: velocidad angular del pendulo
% u: torque del motor 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% sistema no lineal pendulo
a1=((ma+mp)/3)*la^2; %alfa
a2=(mp*lp^2)/3;       %beta
a3=(mp*la*lp)/2;      %lambda
a4=(mp*g*lp)/2;       %delta
den=((a1*a2)-a3^2)+((a2^2+a3^2)*sin(x(3,1))^2);
% campo vectorial
f1=x(2,1);
f2=((a2*a3*(sin(x(3,1))^2-1)*sin(x(3,1))*x(2,1)^2)-(2*a2^2*cos(x(3,1))*sin(x(3,1))*x(2,1)*x(4,1))+...
    (a2*a3*sin(x(3,1))*x(4,1)^2)-(a3*a4*cos(x(3,1))*sin(x(3,1)))+(a2*u))/den;
f3=x(4,1);
f4=((a2*(a1+a2*sin(x(3,1))^2)*cos(x(3,1))*sin(x(3,1))*x(2,1)^2)+...
    (2*a2*a3*(1-sin(x(3,1))^2)*sin(x(3,1))*x(2,1)*x(4,1))-...
    (a3^2*cos(x(3,1))*sin(x(3,1))*x(4,1)^2)+(a4*(a1+a2*sin(x(3,1))^2)*sin(x(3,1)))-(a3*cos(x(3,1))*u))/den;

dxdt(1,1) = f1;
dxdt(2,1) = f2;
dxdt(3,1) = f3;
dxdt(4,1) = f4;
end

