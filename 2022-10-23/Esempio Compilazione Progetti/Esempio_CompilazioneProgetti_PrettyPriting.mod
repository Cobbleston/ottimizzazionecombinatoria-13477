# Esempio sulla Compilazione dei Progetti

set Progetti;
set Macchine;

var x {i in Progetti, j in Macchine} integer;
var z;

param lunpro {i in Progetti}; 

s.t. exe{i in Progetti}: (sum {j in Macchine} x[i,j]) = 1;
s.t. sum{j in Macchine}: (sum {i in Progetti} x[i,j]*lunpro[i]) <= z;
s.t. nonneg{i in Progetti, j in Macchine}: x[i,j] >= 0;
s.t. lessone{i in Progetti, j in Macchine}: x[i,j] <= 1;

minimize obj: z;

solve;

printf " ---- Piano di Durata Minima ----\n";
printf "Durata complessiva = %g\n", z;
for {j in Macchine}
{
  printf "Macchina %s: ", j;
  for {i in Progetti}  
     {
        printf (if x[i,j]=1 then "%s " else ""), i;
     }
  printf "\n";
}

data;

set Progetti := p1 p2 p3 p4 p5 p6 p7 p8;
set Macchine := m1 m2 m3;

param lunpro:=p1 3 p2 4 p3 4 p4 5 p5 5 p6 6 p7 8 p8 9;

end;