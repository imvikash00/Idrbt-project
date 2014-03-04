function Ans = nearPower2( Number );

i = 1;
while i <= Number
    j = i;
    i = i * 2;
end
diff1 = i - Number;
diff2 = Number - j;
if diff1 < diff2
    Ans = i;
else
    Ans = j;
end