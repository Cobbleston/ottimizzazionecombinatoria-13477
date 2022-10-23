# Esercizio 1.26

var x1>=0;
var x2>=0;
var y1>=0;
var y2>=0;
var y3>=0;
var z;

param maxveg;
param maxnonveg;
param densv1; param densv2; 
param densn1; param densn2; param densn3;
param liminfdens;
param limsupdens;
param costov1; param costov2; 
param coston1; param coston2; param coston3;
param ricavo;

s.t. sum: x1 + x2 + y1 + y2 + y3 = z;
s.t. cmaxveg: x1 + x2 <= maxveg;
s.t. cmaxnonveg: y1 + y2 + y3 <= maxnonveg;
s.t. climinfdens: densv1 * x1 + densv2 * x2 + densn1 * y1 + densn2 * y2 + densn3 * y3 >= z * liminfdens;
s.t. climsupdens: densv1 * x1 + densv2 * x2 + densn1 * y1 + densn2 * y2 + densn3 * y3 <= z * limsupdens;

maximize obj: z * ricavo - (costov1 * x1 + costov2 * x2 + coston1 * y1 + coston2 * y2 + coston3 * y3);

solve;

printf " ---- Quantità Ottime da Acquistare ----\n";
printf "Olio Vegetale 1 = %g\n", x1;
printf "Olio Vegetale 2 = %g\n", x2;
printf "Olio Nonvegetale 1 = %g\n", y1;
printf "Olio Nonvegetale 2 = %g\n", y2;
printf "Olio Nonvegetale 2 = %g\n", y3;

data;

param maxveg:=200;
param maxnonveg:=250;
param densv1:=8.8; param densv2:=6.1; 
param densn1:=2.0; param densn2:=4.2; param densn3:=5.0;
param liminfdens:=3;
param limsupdens:=6;
param costov1:=110; param costov2:=120; 
param coston1:=130; param coston2:=110; param coston3:=115;
param ricavo:=150;

end;