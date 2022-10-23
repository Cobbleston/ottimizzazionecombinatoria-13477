# Esercizio 1.26

set OliVegetali;
set OliNonvegetali;

var x {i in OliVegetali} >=0;
var y {j in OliNonvegetali} >=0;
var z;

param maxveg;
param maxnonveg;
param densv {i in OliVegetali}; 
param densn {j in OliNonvegetali};
param liminfdens;
param limsupdens;
param costov {i in OliVegetali};
param coston {j in OliNonvegetali};
param ricavo;

s.t. sum: (sum {i in OliVegetali} x[i]) + (sum {j in OliNonvegetali} y[j]) = z;
s.t. cmaxveg: (sum {i in OliVegetali} x[i]) <= maxveg;
s.t. cmaxnonveg: (sum {j in OliNonvegetali} y[j]) <= maxnonveg;
s.t. climinfdens: (sum {i in OliVegetali} (densv[i] * x[i])) + (sum {j in OliNonvegetali} (densn[j] * y[j])) >= z * liminfdens;
s.t. climsupdens: (sum {i in OliVegetali} (densv[i] * x[i])) + (sum {j in OliNonvegetali} (densn[j] * y[j])) <= z * limsupdens;

maximize obj: (z * ricavo) - (sum {i in OliVegetali} costov[i] * x[i]) - (sum {j in OliNonvegetali} coston[j] * y[j]);

solve;

printf " ---- Quantità Ottime da Acquistare ----\n";
for {i in OliVegetali}
{
printf "Olio Vegetale %s = %g\n", i,x[i];
}
for {j in OliNonvegetali}
{
printf "Olio Non Vegetale %s = %g\n", j,y[j];
}

data;

set OliVegetali := v1 v2;
set OliNonvegetali := n1 n2 n3;

param maxveg:=200;
param maxnonveg:=250;
param densv:= v1 8.8 v2 6.1; 
param densn:= n1 2.0 n2 4.2 n3 5.0;
param liminfdens:=3;
param limsupdens:=6;
param costov:= v1 110 v2 120; 
param coston:= n1 130 n2 110 n3 115;
param ricavo:=150;

end;