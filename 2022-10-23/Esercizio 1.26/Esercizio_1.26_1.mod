# Esercizio 1.26
var x1>=0;
var x2>=0;
var y1>=0;
var y2>=0;
var y3>=0;
s.t. c1: x1 + x2 <= 200;
s.t. c2: y1 + y2 + y3 <= 250;
s.t. c3: 5.8 * x1 + 3.1 * x2 - 1.0 * y1 + 1.2 * y2 + 2.0 * y3 >= 0;
s.t. c4: 2.8 * x1 + 0.1 * x2 - 4.0 * y1 - 1.8 * y2 - 1.0 * y3 <= 0;
maximize obj: 50 * x1 + 30 * x2 + 20 * y1 + 40 * y2 + 35 * y3;
solve;
display x1, x2, y1, y2, y3;
end;